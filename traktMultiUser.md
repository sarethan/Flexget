### Enable interacting with multiple Trakt.tv Lists

1. Have each person create a [Trakt](https://Trakt.tv) account.
2. While each is signed in to their account, have them visit [Trakt Auth](https://trakt.tv/pin/346)
3. Click authorize.
4. copy the code from the folllowing page to your flexget command line:
  $ flexget trakt auth \<username\> \<copied code\>
5. Make sure to add corresponding lines to your [config.yml](https://github.com/sisfs/dotfiles/blob/adding-my-changes/config.yml) and [secretfile.yml](https://github.com/sisfs/dotfiles/blob/adding-my-changes/template-secfile.yml).

