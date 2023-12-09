{ config, pkgs, ... }:

{
  virtualisation = {
    # docker
    docker = {
      enable = true;
      daemon.settings = {
        ## k8s start
        exec-opts=["native.cgroupdriver=systemd"];
        log-driver="json-file";
        log-opts.max-size="100m";
        storage-driver="overlay2";
        ## k8s end
        builder.gc = {
          defaultKeepStorage = "20GB";
          enabled = true;
        };
        registry-mirrors = [
          "https://docker.io"
          # 参考 https://gist.github.com/y0ngb1n/7e8f16af3242c7815e7ca2f0833d3ea6
          "https://docker.m.daocloud.io"
          "https://docker.mirrors.sjtug.sjtu.edu.cn"
          "https://docker.nju.edu.cn"
          "https://dockerproxy.com"
          "https://hub-mirror.c.163.com"
          "https://mirror.baidubce.com"
        ];
      };
    };
  };
}