# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./home.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.networkmanager.enable = true;
  networking.hostName = "mutant"; # Define your hostname.

  # Set your time zone.
  time.timeZone = "Europe/Tallinn";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "et_EE.UTF-8";
    LC_IDENTIFICATION = "et_EE.UTF-8";
    LC_MEASUREMENT = "et_EE.UTF-8";
    LC_MONETARY = "et_EE.UTF-8";
    LC_NAME = "et_EE.UTF-8";
    LC_NUMERIC = "et_EE.UTF-8";
    LC_PAPER = "et_EE.UTF-8";
    LC_TELEPHONE = "et_EE.UTF-8";
    LC_TIME = "et_EE.UTF-8";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.koopa = {
    isNormalUser = true;
    description = "Koopa Killer";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  programs.hyprland.enable = true;

  services.blueman.enable = true;
  sound.enable = true;
  hardware = {
    bluetooth.enable = true;
  };
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Import Scripts
    (import ../scripts/emopicker9000.nix { inherit pkgs; })
    (import ../scripts/task-waybar.nix { inherit pkgs; })
    (import ../scripts/squirtle.nix { inherit pkgs; })
    (import ../scripts/autohypr.nix { inherit pkgs; })
    ## Utils
    eza
    trash-cli
    vim
    wget
    btop
    git
    libvirt
    swww
    polkit_gnome
    # gnome-keyring
    grim
    slurp
    lm_sensors
    unzip
    unrar
    gnome.file-roller
    libnotify
    swaynotificationcenter
    tofi
    xfce.thunar
    imv
    killall
    v4l-utils
    networkmanagerapplet
    ## Misc
    direnv
    ydotool
    wl-clipboard
    socat
    cowsay
    lsd
    neofetch
    pkg-config
    cmatrix
    lolcat
    transmission-gtk
    ## Photo & Video
    mpv
    gimp
    obs-studio
    blender
    kdenlive
    ## Online
    firefox
    # discord
    ## Dev
    # meson
    # glibc
    # hugo
    # gnumake
    # ninja
    go
    nodejs_21
    # godot_4
    # rustup
    # rust-analyzer
    ## Audio
    spotify
    pavucontrol
    audacity
    ## Gaming
    steam
    # zeroad
    # xonotic
    # openra
    # Fonts
    font-awesome
    symbola
    noto-fonts-color-emoji
    material-icons
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  # Steam Configuration
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Nix Package Management
  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # Set Environment Variables
  environment.variables={
   NIXOS_OZONE_WL = "1";
   PATH = [
     "\${HOME}/.local/bin"
     "\${HOME}/.cargo/bin"
     "\$/usr/local/bin"
   ];
   NIXPKGS_ALLOW_UNFREE = "1";
   SCRIPTDIR = "\${HOME}/.local/share/scriptdeps";
   STARSHIP_CONFIG = "\${HOME}/.config/starship/starship.toml";
   XDG_CURRENT_DESKTOP = "Hyprland";
   XDG_SESSION_TYPE = "wayland";
   XDG_SESSION_DESKTOP = "Hyprland";
   GDK_BACKEND = "wayland";
   CLUTTER_BACKEND = "wayland";
   SDL_VIDEODRIVER = "x11";
   XCURSOR_SIZE = "24";
   XCURSOR_THEME = "Bibata-Modern-Ice";
   QT_QPA_PLATFORM = "wayland";
   QT_QPA_PLATFORMTHEME = "qt5ct";
   QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
   QT_AUTO_SCREEN_SCALE_FACTOR = "1";
   MOZ_ENABLE_WAYLAND = "1";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:
  services.openssh.enable = true;
  # programs.ssh.startAgent = true;
  services.fstrim.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
    libinput.enable = true;
    displayManager.sddm.enable = true;
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  # Automatic Updates
  system.autoUpgrade = {
    enable = true;
    channel = "https://nixos.org/channels/nixos-23.11";
  };
  
  nixpkgs.config.allowUnfree = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "koopa" ];
  };

}
