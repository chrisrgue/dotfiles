for d in $(ls -d ~/github_repos/*);do echo git clone $(cd $d && git remote -v |grep fetch |awk '{print $2}') $(basename $d);done
