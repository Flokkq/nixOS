{meta, ...}: {
  programs.btop = {
    enable = true;

    settings = {
      color_theme = "${meta.theme.name}";
      theme_background = true;
      truecolor = true;
      force_tty = false;
      presets = "cpu:1:default,proc:0:default cpu:0:default,mem:0:default,net:0:default cpu:0:block,net:0:tty";
      vim_keys = true;
      rounded_corners = true;
      graph_symbol = "braille";
      graph_symbol_cpu = "default";
      graph_symbol_mem = "default";
      graph_symbol_net = "default";
      graph_symbol_proc = "default";
      shown_boxes = "cpu mem net proc";
      update_ms = 1900;
      proc_sorting = "cpu lazy";
      proc_reversed = false;
      proc_tree = false;
      proc_colors = true;
      proc_gradient = true;
      proc_per_core = false;
      proc_mem_bytes = true;
      proc_cpu_graphs = true;
      proc_info_smaps = false;
      proc_left = true;
      proc_filter_kernel = false;
      proc_aggregate = false;
      cpu_graph_upper = "Auto";
      cpu_graph_lower = "Auto";
      cpu_invert_lower = true;
      cpu_single_graph = false;
      cpu_bottom = false;
      show_uptime = true;
      check_temp = true;
      cpu_sensor = "Auto";
      show_coretemp = true;
      cpu_core_map = "";
      temp_scale = "celsius";
      base_10_sizes = false;
      show_cpu_freq = true;
      clock_format = "%X";
      background_update = true;
      custom_cpu_name = "";
      disks_filter = "";
      mem_graphs = true;
      mem_below_net = false;
      zfs_arc_cached = true;
      show_swap = true;
      swap_disk = true;
      show_disks = true;
      only_physical = true;
      use_fstab = true;
      zfs_hide_datasets = false;
      disk_free_priv = false;
      show_io_stat = true;
      io_mode = false;
      io_graph_combined = false;
      io_graph_speeds = "";
      net_download = 100;
      net_upload = 100;
      net_auto = true;
      net_sync = true;
      net_iface = "";
      show_battery = true;
      selected_battery = "Auto";
      show_battery_watts = true;
      log_level = "WARNING";
    };

    extraConfig = ''
      # Additional configuration lines can be added here if needed
    '';
  };

  home.file.".config/btop/themes/${meta.theme.name}.theme" = {
    text = ''
      # Main background, empty for terminal default, need to be empty if you want transparent background
      theme[main_bg]="${meta.theme.colors.bg}"

      # Main text color
      theme[main_fg]="${meta.theme.colors.fg}"

      # Title color for boxes
      theme[title]="${meta.theme.colors.accent}"

      # Highlight color for keyboard shortcuts
      theme[hi_fg]="${meta.theme.colors.blue}"

      # Background color of selected item in processes box
      theme[selected_bg]="${meta.theme.colors.bg2}"

      # Foreground color of selected item in processes box
      theme[selected_fg]="${meta.theme.colors.blue}"

      # Color of inactive/disabled text
      theme[inactive_fg]="${meta.theme.colors.gray}"

      # Color of text appearing on top of graphs, i.e uptime and current network graph scaling
      theme[graph_text]="${meta.theme.colors.red}"

      # Background color of the percentage meters
      theme[meter_bg]="${meta.theme.colors.bg2}"

      # Misc colors for processes box including mini cpu graphs, details memory graph and details status text
      theme[proc_misc]="${meta.theme.colors.red}"

      # CPU, Memory, Network, Proc box outline colors
      theme[cpu_box]="${meta.theme.colors.purple}"
      theme[mem_box]="${meta.theme.colors.green}"
      theme[net_box]="${meta.theme.colors.orange}"
      theme[proc_box]="${meta.theme.colors.blue}"

      # Box divider line and small boxes line color
      theme[div_line]="${meta.theme.colors.border}"

      # Temperature graph color (Green -> Yellow -> Red)
      theme[temp_start]="${meta.theme.colors.green}"
      theme[temp_mid]="${meta.theme.colors.yellow}"
      theme[temp_end]="${meta.theme.colors.red}"

      # CPU graph colors (Teal -> Lavender)
      theme[cpu_start]="${meta.theme.colors.aqua}"
      theme[cpu_mid]="${meta.theme.colors.accent}"
      theme[cpu_end]="${meta.theme.colors.purple}"

      # Mem/Disk free meter (Purple -> Lavender -> Blue)
      theme[free_start]="${meta.theme.colors.purple}"
      theme[free_mid]="${meta.theme.colors.accent}"
      theme[free_end]="${meta.theme.colors.blue}"

      # Mem/Disk cached meter (Blue -> Lavender)
      theme[cached_start]="${meta.theme.colors.blue}"
      theme[cached_mid]="${meta.theme.colors.accent}"
      theme[cached_end]="${meta.theme.colors.purple}"

      # Mem/Disk available meter (Peach -> Red)
      theme[available_start]="${meta.theme.colors.orange}"
      theme[available_mid]="${meta.theme.colors.red}"
      theme[available_end]="${meta.theme.colors.error}"

      # Mem/Disk used meter (Green -> Sky)
      theme[used_start]="${meta.theme.colors.green}"
      theme[used_mid]="${meta.theme.colors.aqua}"
      theme[used_end]="${meta.theme.colors.info}"

      # Download graph colors (Peach -> Red)
      theme[download_start]="${meta.theme.colors.orange}"
      theme[download_mid]="${meta.theme.colors.red}"
      theme[download_end]="${meta.theme.colors.error}"

      # Upload graph colors (Green -> Sky)
      theme[upload_start]="${meta.theme.colors.green}"
      theme[upload_mid]="${meta.theme.colors.aqua}"
      theme[upload_end]="${meta.theme.colors.info}"

      # Process box color gradient for threads, mem and cpu usage (Sapphire -> Mauve)
      theme[process_start]="${meta.theme.colors.blue}"
      theme[process_mid]="${meta.theme.colors.info}"
      theme[process_end]="${meta.theme.colors.purple}"
    '';
  };
}
