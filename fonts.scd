fonts(1) "" "ual"

# NAME

fonts - configuring fonts using fontconfig

# CHANGING DEFAULT FONTS

To replace the default monospace font with Fira Mono, create a file at
*~/.config/fontconfig/fonts.conf* with the following contents:

```
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
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
  <match target="pattern">
    <test name="family">
      <string>monospace</string>
    </test>
    <edit name="family" mode="assign" binding="same">
      <string>Fira Mono</string>
    </edit>
    <edit name="style" mode="prepend" binding="same">
      <string>Medium</string>
    </edit>
  </match>
</fontconfig>
```

In the above example, we use Hack for the italic font since Fira Mono does not
provide its own italic variant. If we were using a font that _did_ provide its
own italic variant (such as Hack), then *fonts.conf* could simply contain

```
<alias>
  <family>monospace</family>
  <prefer>
    <family>Hack</family>
  </prefer>
</alias>
```

Note that in the above case, the *fonts.conf* file does not contain the XML
header or the parent _<fontconfig>_ tag. These can be omitted when there is only
a single top-level entry in the *fonts.conf* file.

# TESTING A FONT NAME

You can see how *fontconfig* resolves a particular font using the _fc-match_
tool:

```
$ fc-match monospace
FiraMono-Medium.otf: "Fira Mono" "Medium"
```

