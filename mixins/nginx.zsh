nginx_log() {
  local logFiles;
  if [[ -n "$1" ]]; then
    logFiles=(/usr/local/var/www/$1/logs/nginx.*)
  else
    logFiles=(/usr/local/var/log/nginx/*)
  fi
  tail -f -n5 $logFiles
}
