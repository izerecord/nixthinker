{ pkgs, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.wireguard.enable = true;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # NFS
  fileSystems."/mnt/nas" = {
    device = "ubuntu-nas:/srv/nas";
    fsType = "nfs";
    options = [
      "x-systemd.automount"
      "noauto"
    ];
  };
  # optional, but ensures rpc-statsd is running for on demand mounting
  boot.supportedFilesystems = [ "nfs" ];

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocales = [
    "en_US.UTF-8/UTF-8"
    "en_GB.UTF-8/UTF-8"
    "de_DE.UTF-8/UTF-8"
  ];

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Enable the Wayland windowing system for electron apps.
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # gpu stuff
  boot.initrd.kernelModules = [ "amdgpu" ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Enable sddm login manager
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  # Enable the COSMIC desktop environment
  services.desktopManager.cosmic.enable = true;
  # services.displayManager.cosmic-greeter.enable = true;

  services.blueman.enable = true;
  services.dbus.enable = true;

  # used for gnome-calendar
  services.gnome.evolution-data-server.enable = true;
  services.gnome.gnome-online-accounts.enable = true;
  services.gnome.gnome-keyring.enable = true;

  # Hyprland
  programs.hyprland.enable = true; # enable Hyprland
  programs.hyprlock.enable = true;

  # Configure keymap in X11
  #services.xserver.xkb = {
  #  layout = "us";
  #  variant = "euro";
  #};

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pipewire.wireplumber.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "chris";
  services.displayManager.defaultSession = "hyprland";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  #systemd.services."getty@tty1".enable = false;
  #systemd.services."autovt@tty1".enable = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
