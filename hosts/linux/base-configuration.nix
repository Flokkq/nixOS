{meta, ...}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."flokkq" = {
    isNormalUser = true;
    description = meta.hostname;
    hashedPassword = "$6$roAT/Ee8qQqCf88u$33jo8ikm2KdYNMvv88YJQUFXhNEo8P6Gm2pLRqGKgUCz/E0.TcYeG58duD7DlnvH6prqxXh42jmjyFIzxyOk90";
    extraGroups = ["networkmanager" "wheel" "docker" "video" "input" "bluetooth"];
  };

  security.sudo.wheelNeedsPassword = false;
}
