{ config, pkgs, ... }:

let
	username = config.username;
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	system.activationScripts.yazi = ''
		mkdir -p ${home}/.config
		chown ${username}:${group} ${home}/.config
		chmod 700 ${home}/.config

		rm  -rf ${home}/.config/yazi
		mkdir ${home}/.config/yazi
		chown ${username}:${group} ${home}/.config/yazi
		chmod 700 ${home}/.config/yazi

		cp ${./yazi.toml} ${home}/.config/yazi/yazi.toml
		chown ${username}:${group} ${home}/.config/yazi/yazi.toml
		chmod 600 ${home}/.config/yazi/yazi.toml

		cp ${./theme.toml} ${home}/.config/yazi/theme.toml
		chown ${username}:${group} ${home}/.config/yazi/theme.toml
		chmod 600 ${home}/.config/yazi/theme.toml

		cp ${./Catppuccin-mocha.tmTheme} ${home}/.config/yazi/Catppuccin-mocha.tmTheme
		chown ${username}:${group} ${home}/.config/yazi/Catppuccin-mocha.tmTheme
		chmod 600 ${home}/.config/yazi/Catppuccin-mocha.tmTheme
	'';

	environment.systemPackages = with pkgs; [
		yazi
	];
}
