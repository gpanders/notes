# NAME

fonts - configuring fonts using fontconfig

# CHANGING DEFAULT FONTS

To change the default monospace font to, for example, Fira Mono, create a file
at **~/.config/fontconfig/fonts.conf** with the following contents:

    <alias>
      <family>monospace</family>
      <prefer>
        <family>Fira Mono</family>
      </prefer>
    </alias>

Some fonts, such as Fira Mono, do not have an italic style. In those cases, we
can specify to use Fira Mono for the regular and bold styles, but use a
different font, such as Hack, for italic styles:

    <?xml version="1.0"?>
    <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
    <fontconfig>
      <!-- Match bold monospace -->
      <match target="pattern">
        <test name="family">
          <string>monospace</string>
        </test>
        <test name="weight">
          <const>bold</const>
        </test>
        <edit name="family" mode="assign" binding="same">
          <string>Fira Mono</string>
        </edit>
      </match>
      <!-- Match italic monospace -->
      <match target="pattern">
        <test name="family">
          <string>monospace</string>
        </test>
        <test name="slant">
          <const>italic</const>
        </test>
        <edit name="family" mode="assign" binding="same">
          <string>Hack</string>
        </edit>
      </match>
      <!-- Match all other monospace styles -->
      <match target="pattern">
        <test name="family">
          <string>monospace</string>
        </test>
        <edit name="family" mode="assign" binding="same">
          <string>Fira Mono</string>
        </edit>
        <!-- This tag can be omitted to just use the "Regular" style -->
        <edit name="style" mode="prepend" binding="same">
          <string>Medium</string>
        </edit>
      </match>
    </fontconfig>

Note that in the above case, the **fonts.conf** file contains the XML header and
the parent `<fontconfig>` tag. These can be omitted when there is only a single
top-level entry in the **fonts.conf** file (as in the first example).

# TESTING A FONT NAME

You can see how **fontconfig** resolves a particular font using the `fc-match`
tool:

    $ fc-match monospace
    FiraMono-Medium.otf: "Fira Mono" "Medium"

# REFERENCES

- https://www.freedesktop.org/software/fontconfig/fontconfig-user.html
