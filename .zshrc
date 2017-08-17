export PATH="/Users/abandt/bin:/bin:/usr/openwin/bin:/usr/local/etc:/usr/bin:/usr/sbin:/usr/local/bin:/usr/sbin/:/sbin/:/usr/etc/:/usr/ucb:/usr/ccs/bin:/usr/share/emacs/21.2/lisp/play:/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home/bin/:/usr/local/git/bin:/usr/local/mysql/bin:$HOME/.rvm/bin:/Users/abandt/Ruby/Gems/1.8/gems/puppet-4.2.3/bin/"
export MANPATH="/usr/openwin/man:/usr/local/man:/usr/man:/ms/man:/usr/X11R6/man:/usr/local/share/man:/sw/share/man:/usr/share/man:/ms/common/man:/usr/X11/lib/X11/man:/usr/X11/man:/usr/X11/share/man:/usr/X11/share/X11/doc/hardcopy/man"
export LD_LIBRARY_PATH="/usr/local/lib:/usr/lib:/usr/ucblib"
export EDITOR=/usr/local/bin/vim
export GREP_OPTIONS='--color=auto'
export GEM_HOME=/Users/abandt/Ruby/Gems/1.8/
export FACTERLIB=/var/lib/puppet/lib/facter

export adc="lab1 las1 las2 las3 sjc1 sjc2 iad2 iad3 ams3 fra1 hkg1 inf1"

bindkey -e

setopt nobeep nolistbeep autolist nonomatch sh_word_split
setopt promptsubst
unsetopt menucomplete

# Aliases
alias vi='/usr/local/bin/vim'
alias vim='/usr/local/bin/vim'
alias mv='nocorrect mv'       # no spelling correction on mv
alias cp='nocorrect cp'       # no spelling correction on cp
alias mkdir='nocorrect mkdir' # no spelling correction on mkdir
alias ll='ls -la' 
alias rssh='ssh -l root $1'
alias flushcache="sudo killall -HUP mDNSResponder"
alias findershow="defaults write com.apple.Finder AppleShowAllFiles YES"
alias finderhide="defaults write com.apple.Finder AppleShowAllFiles NO"
alias propset='/usr/bin/svn propset svn:keywords "URL Rev Date Author Id"'
alias svnexec='/usr/bin/svn propset svn:executable yes'
alias secrets="ssh -Y fopp-mgt9000.las1.fanops.net"
alias nvi='sudo vi /System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/site_ruby/1.8/nventory.rb'
alias gl_delete='git branch -d $1'
alias gr_delete='git push origin --delete $1'
alias gpush='git push origin $(git rev-parse --abbrev-ref HEAD 2>/dev/null)'
alias gpushf='git push origin $(git rev-parse --abbrev-ref HEAD 2>/dev/null) --force'
alias gpr='git checkout production && git pull --rebase'
alias gpm='git checkout master && git pull --rebase'
# alias arsenal="touch ${HOME}/.arsenal_cookie; docker run -it --rm -e USER=${USER} -v ${HOME}/.arsenal_cookie:/root/.arsenal_cookie docker.rp-core.com/rp_arsenal"


gbr (){

  BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  git pull origin production --rebase &&  git push origin ${BRANCH} --force

}

keypass_pull (){

  ssh -q -Y fopp-mgt9000.las1.fanops.net "cd ~/keepassx && git pull --rebase"
  pushd ~/keypass
  scp fopp-mgt9000.las1.fanops.net:keepassx/techops.kdbx .
  popd

}

keypass_push (){

  ssh -q -Y fopp-mgt9000.las1.fanops.net "cd ~/keepassx && git pull --rebase"
  scp ~/keypass/techops.kdbx fopp-mgt9000.las1.fanops.net:keepassx/
  ssh fopp-mgt9000.las1.fanops.net

}

list_node_classes () {
  for i in $adc ; do
#    echo "--- $i"
    ssh -q root@puppet.${i}.fanops.net "trp-enc list-node-classes $1" 2> /dev/null
  done
}

all_puppet () {
  for i in $adc ; do
    echo "--- $i"
    ssh -q root@puppet.${i}.fanops.net "$1"
  done
}

puppet_reload () {
    if [ -z "$1" ] ; then
        echo "Give an env to run against."
    else
        for i in $(arsenal -q nodes search name=fopp-pup.*${1},status=inservice) ; do
            echo "--- $i"
            ssh -q -l root $i "service nginx reload"
        done
    fi
}

list_class_nodes () {
  if [ "$1" == '-q' ] ; then
     QUIET=true
     CLASS=$2
  else
     QUIET=
     CLASS=$1
  fi

  for i in $adc ; do
    if [[ ! "$QUIET" = true ]] ; then
      echo "--- $i"
    fi
#    ssh -q root@puppet.${i}.fanops.net "trp-enc list-class-nodes $1"
    ssh -q root@puppet.${i}.fanops.net "trp-enc list-class-nodes $CLASS" 2> /dev/null
  done
}

hssh () {
#  hosts=(`~/bin/nv --regexget name=$1,status=inservice`)
  hosts=(`h $1 | grep $2`)
#  if [[ $hosts == "No matching objects" ]]  ; then
  if [ -z "$hosts" ]  ; then
     echo "No servers found".
  else
     first=$hosts[1]
     hosts[1]=()
     # spawn the initial window
     ~/bin/nvh.zsh initial $first
   
     # do the rest if they're there
     if [ ! -z "$hosts" ] ; then
        for h in $hosts ; do
          ~/bin/nvh.zsh add $h
        done
     fi
  fi
}

fssh () {
  hosts=(`cat ${1}`)
  first=$hosts[1]
  hosts[1]=()
  # spawn the initial window
  ~/bin/nvh.zsh initial $first

  # do the rest if they're there
  if [ ! -z "$hosts" ] ; then
     for h in $hosts ; do
       ~/bin/nvh.zsh add $h
     done
  fi
}

fssh_root () {
  hosts=(`cat ${1}`)
  first=$hosts[1]
  hosts[1]=()
  # spawn the initial window
  ~/bin/nvh_root.zsh initial $first

  # do the rest if they're there
  if [ ! -z "$hosts" ] ; then
     for h in $hosts ; do
       ~/bin/nvh_root.zsh add $h
     done
  fi
}


nvssh_root_file () {
  hosts=(`cat ${1}`)
  first=$hosts[1]
  hosts[1]=()
  # spawn the initial window
  ~/bin/nvh_root.zsh initial $first

  # do the rest if they're there
  if [ ! -z "$hosts" ] ; then
     for h in $hosts ; do
       ~/bin/nvh_root.zsh add $h
     done
  fi
}

git_prompt() {
  ref="[$(git rev-parse --abbrev-ref HEAD 2>/dev/null)]"
 
  if [[ "$ref" == '[]' ]]; then
    # do nothing
  else
    gitdir=$(git rev-parse --git-dir);
    if [ ! -f "$gitdir/hooks/prepare-commit-msg" ] ; then
      echo "%{\e[0;33m%}$ref%{\e[0m%}"
      cp ~/.git_hooks/prepare-commit-msg $gitdir/hooks/
      chmod +x $gitdir/hooks/ ~/.git_hooks/prepare-commit-msg
    elif [ "$ref" = '[master]' ] || [ "$ref" = '[production]' ]; then
      echo "%{\e[0;32m%}$ref%{\e[0m%}"
    else
      echo "%{\e[0;31m%}$ref%{\e[0m%}"
    fi
  fi
}

export PS1='|$(print "%{\e[1;36m%}%D{%I:%M %p}%{\e[0m%}")|$(git_prompt)%n@%m:%~> '
export PS2='> '
umask 022

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000
SAVEHIST=1000
touch $HISTFILE

WATCHFMT='%n %a %l from %M at %t.' # For reporting logins/logouts
watch=(notme)                   # watch for everybody but me

precmd ()       {
                 print -Pn "\e]0;%m: %~\a"
                }

preexec ()      {
                 print -Pn "\e]0;%m:%n - running \"$1\"\a"
                }

h () {
  if [ $1 == "--all" ]; then
    search='^f.*-'
    domain=$2
  else
    search='^f.{27,28}$'
    domain=$1
  fi
  host -la ${domain}.fanops.net | awk -F" " '{print $1}' | sed -e 's/\.$//g' | egrep ${search}
}

alh () {
  if [ "$1" == "--all" ]; then
    arg=$1
  fi
  for x in $adc; do 
    h ${arg} ${x}
  done
}


# PATH="/Users/abandt/perl5/bin${PATH:+:${PATH}}"; export PATH;
# PERL5LIB="/Users/abandt/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
# PERL_LOCAL_LIB_ROOT="/Users/abandt/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
# PERL_MB_OPT="--install_base \"/Users/abandt/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=/Users/abandt/perl5"; export PERL_MM_OPT;
