{ config, lib, pkgs, }: {
  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
    # custom settings
    settings = {
      add_newline = true;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
      format = ''
        [](#9A348E)$os$username[](bg:#DA627D fg:#9A348E)$directory[](fg:#DA627D bg:#FCA17D)$git_branch[](fg:#FCA17D bg:#86BBD8)$c$elixir$elm$golang$gradle$haskell$java$julia$nodejs$nim$rust$scala[](fg:#86BBD8 bg:#06969A)$docker_context[](fg:#06969A bg:#33658A)$time$memory_usage[](fg:#33658A bg:#FCA17D)[](fg:#FCA17D bg:#9A348E)$cmd_duration[ ](fg:#9A348E)
          $character'';
      username = {
        show_always = true;
        style_user = "bg:#9A348E";
        style_root = "bg:#9A348E";
        format = "[$user ]($style)";
        disabled = false;
      };
      cmd_duration = {
        min_time = 500;
        style = "bg:#9A348E";
        format = "[ took 󰦖 $duration]($style)";
      };
      os = {
        style = "bg:#9A348E";
        disabled = false; # Disabled by default;
      };
      directory = {
        style = "bg:#DA627D";
        format = "[ $path ]($style)";
        truncation_length = 12;
        truncation_symbol = "…/";
        substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = " ";
          "Pictures" = " ";
        };
      };
      c = {
        symbol = " ";
        style = "bg:#87BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      docker_context = {
        symbol = " ";
        style = "bg:#06969A";
        format = "[ $symbol $context ]($style)";
      };
      elixir = {
        symbol = " ";
        style = "bg:#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      elm = {
        symbol = "";
        style = "bg:#86BBD8";
        format = "[ $symbol($version)]($style)";
      };
      git_branch = {
        symbol = " ";
        style = "bold #110580 bg:#FCA17D";
        format = "[ $symbol $branch ]($style)";
      };
      git_status = {
        conflicted = "⚔️";
        ahead = "🏎️💨\${count}";
        behind = "🐢\${count}";
        diverged = "🔱🏎️💨\${ahead_count} 🐢\${behind_count}";
        untracked = "🛤️\${count}";
        stashed = "📦";
        modified = "📝\${count}";
        staged = "🗃️\${count}";
        renamed = "📛\${count}";
        deleted = "🗑️\${count}";
        style = "bold #110580 bg:#FCA17D";
        format = "[$all_status$ahead_behind]($style)";
      };
      hostname = {
        ssh_only = false;
        format = "<[$hostname]($style)>";
        trim_at = "-";
        style = "bold dimmed white";
        disabled = true;
      };
      golang = {
        symbol = " ";
        style = "bg:#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      gradle = {
        style = "bg:#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      haskell = {
        symbol = " ";
        style = "bg:#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      java = {
        symbol = " ";
        style = "bg:#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      julia = {
        symbol = " ";
        style = "bg:#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      nodejs = {
        symbol = "";
        style = "bg:#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      nim = {
        symbol = "󰆥 ";
        style = "bg:#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      rust = {
        symbol = "";
        style = "bg:#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      scala = {
        symbol = " ";
        style = "bg:#86BBD8";

        format = "[ $symbol ($version) ]($style)";
      };
      time = {
        disabled = false;
        time_format = "%R"; # Hour:Minute Format
        style = "bg:#33658A";
        format = "[ ♥ $time ]($style)";
      };
      character = {
        success_symbol = "[↳](bold green)";
        error_symbol = "[✗](bold red) ";
        vimcmd_symbol = "[↦](bold green) ";
      };
      memory_usage = {
        format = " $symbol\${ram}( | \${swap})";
        threshold = 70;
        style = "bold dimmed white bg:#33658A";
        disabled = false;
      };
    };
  };
}
