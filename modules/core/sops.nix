{...}: {
  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";

  sops.age.keyFile = "/home/lkarasinski/.config/sops/age/keys.txt";

  sops.secrets.ANTHROPIC_API_KEY = {};
}
