  programs.zsh = {
    enable = true;
    shellAliases = {
      # General Aliases
      ls='exa';
      ll='exa -Flh --git -a';
      lst='exa -T --level 1';
      del='trash';
      rm='echo -ne " ❌ ${Red} This command is not allowed here!\n ✅ ${Green} Use ${UGreen}del${NoColor}${Green} instead!\n${NoColor}"';
      vim='nvim';
      vi='nvim';
      # DOCKER Aliases 
      dockerup='colima start --cpu 6 --memory 8 --disk 60';
      dockerdown='colima stop';
      docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q)';
      docker_clean_ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)';
      # GIT Aliases
      gs="git status";
      gc="git clone";
      ga="git add";
      gb="git checkout -b";
      gci="git commit";
      gco="git checkout";
      gp="git pull";
      gpp="git push -u";
      # K8S Aliases
      mk="minikube";
      k="kubectl";
      kg="kubectl get";
      kd="kubectl describe";
      kl="kubectl logs";
      kaf="kubectl apply -f";
      kdel="kubectl delete";
      # TERRAFORM Aliases
      tf="terraform";
      tfwl="terraform workspace list";
      tfws="terraform workspace select";
      tfa="terraform apply";
      tfp="terraform plan";
      tfi="tfswitch ; terraform init";
    };
    histSize = 50000;
    histFile = "${config.xdg.dataHome}/zsh/history";
  };

