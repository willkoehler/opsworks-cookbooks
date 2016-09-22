ffmpeg_file = "ffmpeg-release-64bit-static.tar.xz"
url = "https://johnvansickle.com/ffmpeg/releases/#{ffmpeg_file}"

script 'install ffmpeg' do
  interpreter "bash"
  cwd ::Dir.tmpdir
  code <<-EOH
    wget -q #{url} -O #{ffmpeg_file}
    mkdir -p /usr/local/bin/ffmpeg
    tar -xJf #{ffmpeg_file} -C /usr/local/bin/ffmpeg --strip-components=1
    ln -sf /usr/local/bin/ffmpeg/ffmpeg /usr/bin/ffmpeg
  EOH
end
