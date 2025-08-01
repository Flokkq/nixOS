{meta, ...}: {
  home.file.".config/waypaper/config.ini".text = ''
    [Settings]
    language = en
    folder = ${../../../wallpapers}
    monitors = All
    wallpaper = ${meta.theme.wallpaper}
    show_path_in_tooltip = True
    backend = hyprpaper
    fill = fill
    sort = name
    color = #ffffff
    subfolders = False
    all_subfolders = False
    show_hidden = False
    show_gifs_only = False
    zen_mode = False
    post_command =
    number_of_columns = 3
    swww_transition_type = any
    swww_transition_step = 90
    swww_transition_angle = 0
    swww_transition_duration = 2
    swww_transition_fps = 60
    mpvpaper_sound = False
    mpvpaper_options =
    use_xdg_state = False
  '';
}
