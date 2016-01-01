# [Flexget](http://www.flexget.com) Configuration Files

Created by: [Jeff Wilson](mailto:jeff@jeffalwilson.com)  
Original Available from: (https://github.com/jawilson/dotfiles)

Modified by: [Matt Tallant](mailto:m.tallant+github@gmail.com)
This Fork is available at: (https://github.com/sisfs/dotfiles)

I'm using the [secrets](http://flexget.com/wiki/Plugins/secrets) plugin to hide my private credentials for various plugns. If you want to do this as well, you will need to create a ``secretfile.yml`` file in the same directory as your ``config.yml``.

## Rar-unpacking

My entire setup results in a single video file (``.mkv``, ``.mp4``, etc) in the final destination with a nice name regardless if it's packed in a rar or not.
Here's the gist of how it works:
  1. Flexget accepts the torrent regardless if it's a rar-pack or not
  2. My custom ``content_sort`` plugin ([available in this repository](https://github.com/jawilson/dotfiles/blob/master/flexget/plugins/content_sort.py)) changes the ``move_done`` value if the torrent contains a ``.rar``
  3. The torrent is added to Deluge
  4. Deluge is configured with the [Execute](http://dev.deluge-torrent.org/wiki/Plugins/Execute) plugin to run my ``deluge_torrent_complete`` script ([also available in this repository](https://github.com/jawilson/dotfiles/blob/master/bin/deluge_torrent_complete)) when any torrent is done downloading
  5. ``deluge_torrent_complete`` checks if the torrent is located in the directory we set in step #2, if not it skips to the last step
  6. ``deluge_torrent_complete`` unpacks the first .rar file it finds in the torrent to a 'staging' location
  7. ``deluge_torrent_complete`` calls flexget with a completely separate config, ``sorting.yml`` ([also available in this repository](https://github.com/jawilson/dotfiles/blob/master/flexget/sorting.yml))
  8. The ``sorting.yml`` config checks for files in the 'staging' location from step #6 and renames and moves the files to their appropriate final location
  9. ``deluge_torrent_complete`` tells my [Plex Media Server](https://plex.tv/) to [update the library](http://http://forums.plex.tv/discussion/comment/372419/#Comment_372419) (scan for new files)
