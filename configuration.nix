# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let 
  wallpaper_mini = "/etc/nixos/assets/wallpaper_mini.jpg"; 
in {
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "off"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.


  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "fr";
    enable = true;
    windowManager.i3.enable = true;
    xkb.variant = "";
 
    windowManager.i3.extraPackages = with pkgs; [
        i3status
        i3status-rust
        i3lock
    ];

    displayManager.lightdm = {
	enable = true;

	greeters.mini = {
	  enable = true;
	  user = "nasm";
	
	  extraConfig = ''
	        [greeter]
                show-password-label = false
                [greeter-theme]
                background-image = "${wallpaper_mini}"
	  '';
	};
    };
  };

  environment.systemPackages = with pkgs; [ discord ];

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nasm = {
    isNormalUser = true;
    description = "nasm";
    extraGroups = [ "libvirtd" "docker" 
                    "wheel" "video" "audio" "disk" "networkmanager" 
       ];
  };

  # use docker without Root access (Rootless docker)
  virtualisation.docker.rootless = {
     enable = true;
     setSocketVariable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  nix.gc.automatic = true;
  nix.settings.auto-optimise-store = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  nix.settings.experimental-features = ["nix-command" "flakes"];

  #services.devmon.enable = true ;
  #services.gvfs.enable = true ;
  #services.udisks2.enable = true ;

  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;
  boot.kernelModules = [ "kvm-amd" "kvm-intel" ];


  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Configure console keymap
  console.keyMap = "fr";
  fonts.packages = [ pkgs.d2coding ];

  i18n = {
   extraLocaleSettings = {
      LC_ADDRESS = "fr_FR.UTF-8";
      LC_IDENTIFICATION = "fr_FR.UTF-8";
      LC_MEASUREMENT = "fr_FR.UTF-8";
      LC_MONETARY = "fr_FR.UTF-8";
      LC_NAME = "fr_FR.UTF-8";
      LC_NUMERIC = "fr_FR.UTF-8";
      LC_PAPER = "fr_FR.UTF-8";
      LC_TELEPHONE = "fr_FR.UTF-8";
      LC_TIME = "fr_FR.UTF-8";
    };
    defaultLocale = "fr_FR.UTF-8";
    inputMethod = {
      enabled = "kime";
      kime.daemonModules = [ "Xim" ];
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
