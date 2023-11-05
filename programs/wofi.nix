{...}: {
  programs.wofi = {
    enable = true;

    settings = {
      insensitive = true;
      run-always_parse_args = true;
      run-cache_file = "/dev/null";
      run-exec_search = true;
    };

    style = ''
* {
font-size: 20px;
}
'';
  };
}
