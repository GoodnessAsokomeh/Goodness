#!/bin/bash
# Workada image-pair toolchain: python3, Pillow, curl, ffmpeg, tesseract.
#
# Run this by hand after starting a session:  bash scripts/setup-toolchain.sh
# The web container is ephemeral, so python3 and curl survive but Pillow,
# ffmpeg and tesseract have to be reinstalled each time.
# Idempotent and non-interactive: anything already present is left alone.
set -uo pipefail

log() { echo "[workada-setup] $*" >&2; }

need_apt=()
command -v ffmpeg    >/dev/null 2>&1 || need_apt+=(ffmpeg)
command -v tesseract >/dev/null 2>&1 || need_apt+=(tesseract-ocr tesseract-ocr-eng)

if [ ${#need_apt[@]} -gt 0 ]; then
  log "installing: ${need_apt[*]}"
  export DEBIAN_FRONTEND=noninteractive
  # Third-party PPAs are blocked by the egress policy; their failures are not ours.
  apt-get update -qq >/dev/null 2>&1 || log "apt-get update reported errors, continuing"
  apt-get install -y -qq "${need_apt[@]}" >/dev/null 2>&1 \
    || log "WARNING: apt-get install failed for: ${need_apt[*]}"
else
  log "ffmpeg and tesseract already present"
fi

if python3 -c "import PIL" >/dev/null 2>&1; then
  log "Pillow already present"
else
  log "installing Pillow"
  python3 -m pip install --quiet --break-system-packages Pillow >/dev/null 2>&1 \
    || log "WARNING: pip install Pillow failed"
fi

# Report what the session actually has, so a partial install is visible, not silent.
status=0
report() { if v=$(eval "$2" 2>&1 | head -1) && [ -n "$v" ]; then log "OK   $v"; else log "MISS $1"; status=1; fi; }
report python3   "python3 -V"
report Pillow    "python3 -c \"import PIL; print('Pillow ' + PIL.__version__)\""
report curl      "curl --version"
report ffmpeg    "ffmpeg -version"
report tesseract "tesseract --version"

if [ $status -eq 0 ]; then log "toolchain ready"; else log "toolchain INCOMPLETE, see MISS lines above"; fi
exit $status
