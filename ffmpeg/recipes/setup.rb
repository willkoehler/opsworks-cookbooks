ffmpeg_file = "ffmpeg-release-64bit-static.tar.xz"
url = "https://johnvansickle.com/ffmpeg/releases/#{ffmpeg_file}"

script 'install ffmpeg' do
  interpreter "bash"
  cwd ::Dir.tmpdir
  code <<-EOH
    wget -q #{url} -O #{ffmpeg_file}
    mkdir -p /opt/ffmpeg
    tar -xJf #{ffmpeg_file} -C /opt/ffmpeg --strip-components=1 --no-same-owner
    ln -sf /opt/ffmpeg/ffmpeg /usr/local/bin/ffmpeg
    ln -sf /opt/ffmpeg/ffprobe /usr/local/bin/ffprobe
  EOH
end
