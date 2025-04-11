# nixos-yazi

nixos-yazi = fetchGit {
	url = "https://github.com/typovrak/nixos-yazi.git";
	ref = "main";
};

(import "${nixos-yazi}/configuration.nix")
