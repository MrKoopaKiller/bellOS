{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    histSize = 10000000;
    histFile = "${config.home-manager.users.koopa.home.homeDirectory}/.zsh_history";

    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "sudo" "docker" "kubectl" ];
    };

    shellAliases = {
        # General Aliases
        ls="eza";
        ll="eza -Flh --git -a";
        lst="exa -T --level 1";
        del="trash";
        rm="echo -ne 'use del command instead'";
        # DOCKER Aliases 
        docker_clean_images="docker rmi $(docker images -a --filter=dangling=true -q)";
        docker_clean_ps="docker rm $(docker ps --filter=status=exited --filter=status=created -q)";
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
        tg="terragrunt";
        tfa="terraform apply";
        tfp="terraform plan";
        tfi="tfswitch ; terraform init";
    };
  };
}