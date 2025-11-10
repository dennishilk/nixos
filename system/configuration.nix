{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  ##########################
  #    Bootloader + Kernel #
  ##########################

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  ##########################
  #       Host + Locale    #
  ##########################

  networking.hostName = "cthulhu";  
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "de_DE.UTF-8";
  console.keyMap = "de";

  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  ##########################
  #       X11 + Xfce       #
  ##########################

  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;

  ##########################
  #     NVIDIA Open-Driver #
  ##########################

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    open = true;  # for RTX/Turing+ 
    modesetting.enable = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
   ##########################
   #   NVIDIA Force FCP     #
   ##########################

services.xserver.config = ''
  Section "Device"
    Identifier "Nvidia Card"
    Driver "nvidia"
    VendorName "NVIDIA Corporation"
    Option "AllowEmptyInitialConfiguration"
    Option "ForceFullCompositionPipeline" "true"
    Option "ModeValidation" "AllowNonEdidModes"
  EndSection
'';

  ##########################
  #      Audio (Pipewire)  #
  ##########################

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  ##########################
  #        User Setup      #
  ##########################

  users.users.nebu = {
    isNormalUser = true;
    description = "nebu";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  ##########################
  #      Zsh & Terminal    #
  ##########################

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };

  ##########################
  #        Fonts Setup     #
  ##########################

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs.nerd-fonts; [
      fira-code
      jetbrains-mono
      hack
    ];
  };

  #############################
  # Program  Themes & Styling #
  #############################

  environment.systemPackages = with pkgs; [
    # Terminal & Shell
    kitty
    zsh
    oh-my-zsh
    fastfetch

    # GTK Themes & Icons
    gruvbox-gtk-theme
    papirus-icon-theme
    capitaine-cursors

    # Browser & Gaming
    google-chrome
    mangohud
    protonup-qt
    steam
    
    # tools
    openssl
    sox
    gnutar
    gzip
    rsync
  ];

  ##########################
  #         Picom WM       #
  ##########################

  services.picom = {
    enable = true;
    backend = "glx";              # Optimized for NVIDIA
    vSync = true;                 # Prevent Tearing
    settings = {
      "unredir-if-possible" = true;
      "detect-transient" = true;
      "detect-client-leader" = true;
      "shadow" = true;
      "shadow-radius" = 12;
      "shadow-opacity" = 0.4;
    };
  };

  ##########################
  #     Steam & Proton     #
  ##########################

  programs.steam = {
    enable = true;
  };

  ##########################
  #     Allow Unfree       #
  ##########################

  nixpkgs.config.allowUnfree = true;

  ##########################
  #     System Version     #
  ##########################

  system.stateVersion = "25.05";
}
