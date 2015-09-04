@echo off
call "F:\SelfApplication\cwRsync\cwrsync.cmd"
F:\SelfApplication\cwRsync\rsync --progress %1 %2 %3 %4 --chmod=u=rwX,go=rX,Fugo-x -acz --include=core --force --delete --exclude-from=rsync_exclude.txt -e "F:\SelfApplication\cwRsync\ssh -p1122" ./ coder@coder.vizzhost.com:/home/coder/www/leave_record