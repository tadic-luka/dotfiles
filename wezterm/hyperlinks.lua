local consts = require 'consts';
return {
    -- Linkify things that look like URLs
    -- This is actually the default if you don't specify any hyperlink_rules
    {
      regex = "\\b\\w+://(?:[\\w.-]+)\\.[a-z]{2,15}\\S*\\b",
      format = "$0",
    },

    -- linkify email addresses
    {
      regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
      format = "mailto:$0",
    },

    -- file:// URI
    {
      regex = "\\bfile://\\S*\\b",
      format = "$0",
    },

    -- Make diff numbers clickable
    {
      regex = consts.diff_reg,
      format = "https://www.internalfb.com/diff/$0"
    },
    -- Make task numbers clickable
    {
      regex = consts.task_reg,
      format = "https://www.internalfb.com/$0"
    },
    -- Make paste numbers clickable
    {
      regex = consts.paste_reg,
      format = "https://www.internalfb.com/phabricator/paste/view/$0"
    }
}
