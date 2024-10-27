{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:
buildGoModule rec {
  pname = "cbtxt";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "lkarasinski";
    repo = "cbtxt";
    rev = "dac8f6eb9b5e41390643678e4aea0763981e4cbe";
    hash = "sha256-coSvYMyX6mXsj6r3cu2WOyl7Wo+BlhLJMTQOGICiUFI=";
  };

  # This will allow Nix to vendor the dependencies
  vendorHash = "sha256-qXbVxL+w3CgbacsmRkVWeg8oCtGeKXubnR4XWPMNN+8=";

  # Enable network access during build for module downloads
  proxyVendor = true;

  # Allow Go to fetch dependencies
  GOPROXY = "https://proxy.golang.org,direct";

  meta = with lib; {
    description = "Tool for transforming your codebase into a single text file";
    homepage = "https://github.com/lkarasinski/cbtxt";
    license = licenses.mit;
  };
}
