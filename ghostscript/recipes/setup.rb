gs_version = "9.21"
gs_file = "ghostscript-9.21"
url = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs921/#{gs_file}.tar.gz"

script "install ghostscript #{gs_version}" do
  interpreter "bash"
  cwd ::Dir.tmpdir
  code <<-EOH
    set -e
    wget #{url}
    tar -zxvf #{gs_file}.tar.gz
    cd #{gs_file}
    ./configure --prefix=/usr --enable-dynamic --disable-compile-inits --with-system-libtiff
    make
    make so
    make install
    make soinstall
    install -v -m644 base/*.h /usr/include/ghostscript
    ln -sfv ghostscript /usr/include/ps
    ln -sfvn ../ghostscript/#{gs_version}/doc /usr/share/doc/#{gs_file}
  EOH
  not_if { OpsWorks::ShellOut.shellout("gs --version").strip == gs_version }
end
