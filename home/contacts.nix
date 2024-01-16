{ pkgs, ... }:
{
  home.packages = with pkgs; [ 
    neochat
    telegram-desktop
  ];
 #   kmail
 # ] ++ (with pkgs.libsForQt5; [
 #   kdepim-runtime
 #   merkuro
 #   akonadi
 #   akonadi-mime
 #   akonadi-notes
 #   akonadiconsole
 #   akonadi-search
 #   akonadi-contacts
 #   akonadi-calendar
 #   akonadi-calendar-tools
 #   kdepim-addons
 #   kdepim-runtime
 #   kleopatra
 #   korganizer
 #   bogofilter
 # ]);
}