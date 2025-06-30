{
  programs.fastfetch = {
    enable = true;

    settings = {
      display = {
        color = {
          keys = "35";
          output = "95";
        };
        separator = " ➜  ";
      };

      logo = {
        source = ./nixos.png;
        type = "kitty-direct";
        height = 10;
        width = 20;
        padding = {
          top = 7;
          left = 2;
        };
      };

      modules = [
        "break"
        "break"
        "break"
        {
          type = "custom";
          format = " {#90}   {#31}   {#32}   {#33}   {#34}   {#35}   {#36}   {#37}  ";
        }
        "break"
        {
          type = "title";
          keyWidth = 10;
        }
        "break"
        {
          type = "os";
          key = " ";
          keyColor = "34";
        }
        {
          type = "kernel";
          key = " ";
          keyColor = "34";
        }
        {
          type = "packages";
          key = " ";
          keyColor = "34";
        }
        {
          type = "shell";
          key = " ";
          keyColor = "34";
        }
        "break"
        {
          type = "wm";
          key = " ";
          keyColor = "34";
        }
        {
          type = "uptime";
          key = " ";
          keyColor = "34";
        }
        {
          type = "media";
          key = "󰝚 ";
          keyColor = "34";
        }
        "break"
        {
          type = "cpu";
          key = " ";
          keyColor = "blue";
        }
        {
          type = "gpu";
          key = " ";
          keyColor = "blue";
        }
        {
          type = "memory";
          key = " ";
          keyColor = "blue";
        }
        "break"
        {
          type = "custom";
          format = " {#90}   {#31}   {#32}   {#33}   {#34}   {#35}   {#36}   {#37}  ";
        }
        "break"
        "break"
      ];
    };
  };
}
