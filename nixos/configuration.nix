# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  
  nix.settings.experimental-features = ["nix-command" "flakes"];

  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.supportedFilesystems = [ "ntfs" ];
  
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  
  # Enable networking
  networking.networkmanager.enable = true;
  
  # Set your time zone.
  time.timeZone = "America/Toronto";
  
  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";
  
  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };
  
  # Enable CUPS to print documents.
  services.printing.enable = true;
  
  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
    
    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
  
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.romanz = {
    isNormalUser = true;
    description = "Roman Zupancic";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.bash;
  };
  
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    htop
    (python3.withPackages (ps: with ps; [
      ps.requests
    ]))
    
    (nerdfonts.override {fonts = ["FiraCode" "CascadiaCode"];})

    neofetch

    git

    glxinfo
    
    # Wayland stuff
    hyprpaper
    dunst # Notification manager
    
    (pkgs.waybar.overrideAttrs(oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
    }))
    
    wofi
    wl-clipboard
    
    brightnessctl # Brightness control application
    pamixer # Sound mixer
    ncpamixer
  ];
  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  
  # List services that you want to enable:
  
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  
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
  system.stateVersion = "23.05"; # Did you read the comment?
  
  programs.hyprland = {
    enable= true;
    nvidiaPatches=true;
    xwayland.enable=true;
  };
  
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };
  
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    
    nvidia = {
      modesetting.enable = true;
      
      open = false;
      
      nvidiaSettings = true;
      
      powerManagement.enable = lib.mkForce false;
      
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        # offload.enable = false;
        reverseSync.enable = true;
        
        
        amdgpuBusId = "PCI:6:0:0";
        nvidiaBusId = "PCI:1:0:0";
      };
      
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
  
  services.xserver.videoDrivers = lib.mkForce ["nvidia"];
  
  programs.steam = {
    enable = true;
  };
  
  fonts.fonts = with pkgs; [
    cascadia-code
    font-awesome
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk
    emojione
    corefonts
    vistafonts
  ];
  
  # What does this do? Hyprland?
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
  
  powerManagement = {
    enable = true;
    cpuFreqGovernor = "powersave";
  };
  
  services.tlp.enable = true;
  
  users.defaultUserShell = pkgs.bash;

  documentation.dev.enable = true;

  services.greetd = {
      enable = true;
      settings = {
          default_session = {
              command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
              user = "romanz";
          };
      };
  };
}
