{ config, pkgs, ... }:

{

  nix.settings.substituters = [
    # 中科大
    "https://mirrors.ustc.edu.cn/nix-channels/store"
    # 上交
    "https://mirror.sjtu.edu.cn/nix-channels/store"
    # 南大
    "https://mirror.nju.edu.cn/nix-channels/store"
  ];


}