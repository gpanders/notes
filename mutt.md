# NAME

mutt - cheat sheet for mutt

# DATE RANGE SYNTAX

Absolute dates
: `[DD/MM/YY\]-DD/MM/YY` (month and year are optional, defaulting to the
  current month and year). If you omit the first date, all messages _before_ the
  given date will be selected.

Relative dates
: Can be specified as `>offset` for messages older than `offset` units,
  `<offset` for messages newer than `offset` units, or `=offset` for messages
  exactly `offset` units old.

`offset` is specified as a positive number with one of the units from the below
table:

| **Unit** | **Description** |
| --   | --          |
| y    | Years       |
| m    | Months      |
| w    | Weeks       |
| d    | Days        |
| H    | Hours       |
| M    | Minutes     |
| S    | Seconds     |

# SEARCH PATTERN SYNTAX

~A
: All messages

~b <expression>
: Search in body

~B <expression>
: Search in entire message

~c <expression>
: Search for messages CC'd to a specific user name

~C <expression>
: Search for messages to or CC'd to a specific user name

~D
: Search for deleted messages

~d <date range>
: Search for messages sent within a specific date range

~E
: Search for expired messages

~e <expression>
: Search for messages with an expression in the `sender` field

~F
: Search for flagged messages

~f <username>
: Search for messages from a specific user

~g
: Search for PGP signed messages

~G
: Search for PGP encrypted messages

~h <expression>
: Search message headers

~k
: Search for messages which contain PGP keys

~i <id>
: Search for specific message IDs. This references the contents of the
  `Message-ID` header.

~L <expression>
: Search for messages originated OR received by an expression

~l
: Search for all messages addressed to a mailing list

~m <range>
: Search for messages in the message number range given. This command targets
  the message number as shown in the index. Give the number as a range
  delimited by a dash, example: `~m 1-5`

~n <score range>
: Search for messages with a score in the range given. Give the score as a
  number range delimited by a dash, example: `~n 1.0-5.0`

~N
: Search for new messages

~O
: Search for old messages

~p
: Search for messages addressed to you

~P
: Search for messages from yourself

~Q
: Search for messages you have replied to

~R
: Search for read messages

~r <date range>
: Search for messages with a received date in the given range. Give the date
  as a range delimited by a dash

~S
: Search for superseded messages

~s <expression>
: Search for messages with a subject matching the given expression

~T
: Search for tagged messages

~t <username>
: Search for messages addressed to a specific user

~U
: Search for unread messages

~v
: Search for messages that are part of a collapsed thread

~x <expression>
: Search for messages with the `References` field containing the given
  expression

~y <expression>
: Search for messages with the `X-Label` header containing the given
  expression

~z <byte range>
: Search for messages with a size in the given range. Give the range as a
  number of bytes, delimited by a dash. Example: `~z 102400-409600`

~=
: Search for duplicate messages

# REFERENCE

- https://kapeli.com/cheat_sheets/Mutt.docset/Contents/Resources/Documents/index
