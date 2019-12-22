ukinau's dotfiles

# Target Env

This dot files are mainly targetting against Mac.

# Directory Structure

Since $HOME directory in MAC have many "system maintained" directory, It's hard to maintain/bring the data inside $HOME directory to other MAC.
That's why I decided to create new $HOME directory under original $HOME and changed $HOME in /etc/profile (early stage of loading rc, profile file in shell initialization)

This dotfiles repository is expected to be used within following directory structure

```
$HOME(original home[/Users/<username>])
  - workspace(new home we should use)
    - materials
      - mine: Material I created
      - others: Material Other created and worth keeping
      - temp: Material I need temporally (e.g. receipt, contract paper...)
    - bin: Utility Scripts which we can not maintain public github repository (e.g. company specific system automation)
    - ukipedia.dotfiles <= This repository
      - bin: General Utility Scripts
```


# bin/

## File Related

* mvm <file name>
  * move <file name> to <$HOME/materials/mine>
* mvo <file name>
  * move <file name> to <$HOME/materials/others>
* mvt <file name>
  * move <file name> to <$HOME/materials/temp>
* open_materials
  * open <$HOME/materials> directory with Finder
