# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./system/neovim.nix
    ./system/hyprland.nix
    ./system/terminal.nix
    ./system/drivers/amd/amdgpu.nix
  ];

  # Bootloader.
  #boot.loader.grub.enable = true;
  #boot.loader.grub.device = "/dev/nvme0n1";
  #boot.loader.grub.useOSProber = true;

  # Enable the Flakes feature and the accompanying new nix command-line tool
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Oslo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8"
  ];
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "no";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "no";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.teto = {
    isNormalUser = true;
    description = "Teto";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "teto";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.hyprland.enable = true;

  hardware.bluetooth.enable = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
    kitty
    blueman
    pavucontrol
  ];

  fonts = {
    packages = with pkgs; [
      # (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })

      nerd-fonts.fira-code
      nerd-fonts.droid-sans-mono

      jetbrains-mono
      noto-fonts
      noto-fonts-emoji
      roboto
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "noto-fonts" ];
        sansSerif = [ "roboto" ];
        monospace = [ "jetbrains-mono" ];
      };
    };
  };

  services.xserver = {
    dpi = 144; # Adjust for your scaling (96 is default, 144 = 1.5 scaling)
  };

  environment.variables = {
    GDK_SCALE = "1.5"; # For GTK apps
    GDK_DPI_SCALE = "1.0"; # Compensates for GTK scaling if needed
    QT_AUTO_SCREEN_SCALE_FACTOR = "0"; # Prevents auto-scaling in Qt apps
    QT_SCALE_FACTOR = "1.5"; # Sets scaling for Qt apps
    #Electron apps
    ELECTRON_ENABLE_AUTO_DPI_SCALING = "true"; # Enable DPI scaling in Electron apps
    ELECTRON_FORCE_DEVICE_SCALE_FACTOR = "1.5"; # Forces scaling factor for WebCord

  };
  # boot.supportedFilesystems = [ "ntfs" ];

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };
  services.pipewire.wireplumber.enable = true;

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
  system.stateVersion = "25.05"; # Did you read the comment?
}
