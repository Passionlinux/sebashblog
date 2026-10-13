#!/usr/bin/env bash
# SPDX-License-Identifier: GPL-3.0-or-later

# BashBlog, a simple blog system written in a single bash script
# (C) Carlos Fenollosa <carlos.fenollosa@gmail.com>, 2011-2016 and contributors
# https://github.com/carlesfe/bashblog/contributors
# Check out README.md for more details

# Global variables
# It is recommended to perform a 'rebuild' after changing any of this in the code

# Config file. Any settings "key=value" written there will override the
# global_variables defaults. Useful to avoid editing bb.sh and having to deal
# with merges in VCS
global_config=".config"

# This function will load all the variables defined here. They might be overridden
# by the 'global_config' file contents
global_variables() {
    global_software_name="BashBlog"
    global_software_version="2.10"

    # Blog title
    global_title="SebashBlog"
    # The typical subtitle for each blog
    global_description="PassionGNU/Linux, la passion du libre..."
    # Image displayed at the top of every generated page (relative to the blog).
    global_banner_image="bandeau-gentoo-passionlinux.png"
    # The public base URL for this blog
    global_url="${BLOG_URL:-https://passiongnulinux.free.nf}"

    # Your name
    global_author="Sébastien"
    # You can use twitter or facebook or anything for global_author_url
    global_author_url="https://example.fr" 
    # Your email
    global_email="vous@example.fr"

    # CC by-nc-nd is a good starting point, you can change this to "&copy;" for Copyright
    global_license="CC BY-NC-ND"
    global_language="fr"
    rss_language="fr-fr"

    # If you have a Google Analytics ID (UA-XXXXX) and wish to use the standard
    # embedding code, put it on global_analytics
    # If you have custom analytics code (i.e. non-google) or want to use the Universal
    # code, leave global_analytics empty and specify a global_analytics_file
    global_analytics=""
    global_analytics_file=""

    # Leave this empty (i.e. "") if you don't want to use feedburner, 
    # or change it to your own URL
    global_feedburner=""

    # Change this to your username if you want to use twitter for comments
    global_twitter_username=""
    # Default image for the Twitter cards. Use an absolute URL
    global_twitter_card_image=""
    # Set this to false for a Twitter button with share count. The cookieless version
    # is just a link.
    global_twitter_cookieless="true"
    # Default search page, where tweets more than a week old are hidden
    # shellcheck disable=SC2034
    global_twitter_search="twitter"

    # Change this to your disqus username to use disqus for comments
    global_disqus_username=""


    # Blog generated files
    # index page of blog (it is usually good to use "index.html" here)
    index_file="index.html"
    number_of_index_articles="8"
    about_file="a-propos.html"
    search_file="rechercher.html"
    links_file="liens.html"
    search_index_file="search-index.json"
    search_script_file="search.js"
    # global archive
    archive_index="all_posts.html"
    tags_index="all_tags.html"

    # Non blogpost files. Bashblog will ignore these. Useful for static pages and custom content
    # Add them as a bash array, e.g. non_blogpost_files=("news.html" "test.html")
    non_blogpost_files=("$about_file" "$search_file" "$links_file")

    # feed file (rss in this case)
    blog_feed="feed.rss"
    number_of_feed_articles="10"
    # "cut" blog entry when putting it to index page. Leave blank for full articles in front page
    # i.e. include only up to first '<hr>', or '----' in markdown
    cut_do="cut"
    # When cutting, cut also tags? If "no", tags will appear in index page for cut articles
    cut_tags="yes"
    # Regexp matching the HTML line where to do the cut
    # note that slash is regexp separator so you need to prepend it with backslash
    # Accept both the legacy HTML separator and the common excerpt marker.
    cut_line='(<hr ?\/?>|<!-- more -->)'
    # save markdown file when posting with "bb post -m". Leave blank to discard it.
    save_markdown="yes"
    # prefix for tags/categories files
    # please make sure that no other html file starts with this prefix
    prefix_tags="tag_"
    # personalized header and footer (only if you know what you're doing)
    # DO NOT name them .header.html, .footer.html or they will be overwritten
    header_file=""
    footer_file="includes/footer.njk"
    # extra content to add just after we open the <body> tag
    # and before the actual blog content
    body_begin_file=""
    # extra content to add just before we close </body>
    body_end_file=""
    # extra content to ONLY on the index page AFTER `body_begin_file` contents
    # and before the actual content
    body_begin_file_index=""
    # Optional HTML fragment appended after each full post, but outside its entry markers
    comments_file="includes/comments.njk"
    # CSS files to include on every page, f.ex. css_include=('main.css' 'blog.css')
    # leave empty to use generated
    css_include=()
    # HTML files to exclude from index, f.ex. post_exclude=('imprint.html 'aboutme.html')
    html_exclude=()

    # Localization and i18n
    # "Comments?" (used in twitter link after every post)
    template_comments="Commentaires"
    # "Read more..." (link under cut article on index page)
    template_read_more="Lire la suite…"
    # "View more posts" (used on bottom of index page as link to archive)
    template_archive="Voir tous les billets"
    # "All posts" (title of archive page)
    template_archive_title="Tous les billets"
    # "All tags"
    template_tags_title="Toutes les étiquettes"
    # "posts" (on "All tags" page, text at the end of each tag line, like "2. Music - 15 posts")
    template_tags_posts="billets"
    template_tags_posts_2_4="billets"
    template_tags_posts_singular="billet"
    # "Posts tagged" (text on a title of a page with index of one tag, like "My Blog - Posts tagged "Music"")
    template_tag_title="Billets avec l’étiquette"
    # "Tags:" (beginning of line in HTML file with list of all tags for this article)
    template_tags_line_header="Étiquettes :"
    legacy_tags_line_header="Tags:"
    # "Back to the index page" (used on archive page, it is link to blog index)
    template_archive_index_page="Retour à l’accueil"
    # "Subscribe" (used on bottom of index page, it is link to RSS feed)
    template_subscribe="Flux RSS"
    # "Subscribe to this page..." (used as text for browser feed button that is embedded to html)
    template_subscribe_browser_button="S’abonner à ce flux"
    # "Tweet" (used as twitter text button for posting to twitter)
    template_twitter_button="Partager"
    template_twitter_comment="&lt;Ajoutez votre commentaire et conservez l’URL pour permettre aux lecteurs de suivre la discussion&gt;"
    
    # The locale to use for the dates displayed on screen
    date_format="%d %B %Y"
    date_locale="fr_FR.UTF-8"
    date_inpost="bashblog_timestamp"
    date_created_inpost="bashblog_created_timestamp"
    # Don't change these dates
    date_format_full="%a, %d %b %Y %H:%M:%S %z"
    date_format_timestamp="%Y%m%d%H%M.%S"
    date_allposts_header="%B %Y"

    # Perform the post title -> filename conversion
    # Experts only. You may need to tune the locales too
    # Leave empty for no conversion, which is not recommended
    # This default filter respects backwards compatibility
    convert_filename="iconv -f utf-8 -t ascii//translit | sed 's/^-*//' | tr [:upper:] [:lower:] | tr ' ' '-' | tr -dc '[:alnum:]-'"

    # URL where you can view the post while it's being edited
    # same as global_url by default
    # You can change it to path on your computer, if you write posts locally
    # before copying them to the server
    preview_url=""

    # Markdown location. Trying to autodetect by default.
    # The invocation must support the signature 'markdown_bin in.md > out.html'
    if [[ -f Markdown.pl ]]; then
        markdown_bin=./Markdown.pl
    else
        # type -P searches PATH for executables only; command -v would also
        # find this script's own markdown() function and recurse into it.
        markdown_bin=$(type -P Markdown.pl 2>/dev/null || type -P markdown 2>/dev/null || true)
    fi
}

# Check for the validity of some variables
# DO NOT EDIT THIS FUNCTION unless you know what you're doing
global_variables_check() {
    if [[ $header_file == .header.html ]]; then
        echo "Configuration invalide : '.header.html' ne peut pas être utilisé pour 'header_file'." >&2
        return 1
    fi
    if [[ $footer_file == .footer.html ]]; then
        echo "Configuration invalide : '.footer.html' ne peut pas être utilisé pour 'footer_file'." >&2
        return 1
    fi
    if [[ ! $prefix_tags =~ ^[[:alnum:]_-]+$ ]]; then
        echo "Le préfixe des fichiers d’étiquettes ne peut contenir que des lettres, chiffres, tirets et tirets bas." >&2
        return 1
    fi
}


# Test if the markdown script is working correctly
test_markdown() {
    [[ -n $markdown_bin ]] || return 1
    local rendered
    local -a markdown_command=()
    read -r -a markdown_command <<< "$markdown_bin"
    ((${#markdown_command[@]})) || return 1
    rendered=$("${markdown_command[@]}" <<< $'line 1\n\nline 2') || return 1
    [[ $rendered == $'<p>line 1</p>\n\n<p>line 2</p>' ||
       $rendered == $'<p>line 1</p>\n<p>line 2</p>' ]]
}


# Parse a Markdown file into HTML and return the generated file
markdown() {
    out=$(mktemp ./.bb-markdown.XXXXXX) || return 1
    local -a markdown_command=()
    read -r -a markdown_command <<< "$markdown_bin"
    if ((${#markdown_command[@]} == 0)) || ! "${markdown_command[@]}" "$1" > "$out"; then
        rm -f -- "$out"
        echo "Échec de la conversion Markdown du fichier « $1 »." >&2
        return 1
    fi
    echo "$out"
}

# Run editors configured either as a single executable or as a simple command
# plus arguments (for example: "code --wait"). No shell evaluation is needed.
run_editor() {
    local -a editor_command=()
    # Prefer the user's explicitly selected visual/terminal editor. When
    # neither is set, use the system's `editor` alternative (for example
    # managed by update-alternatives on Debian/Ubuntu).
    local editor_setting=${VISUAL:-${EDITOR:-editor}}
    read -r -a editor_command <<< "$editor_setting"
    if ((${#editor_command[@]} == 0)); then
        echo "Aucun éditeur n’est configuré ; définis VISUAL ou EDITOR." >&2
        return 1
    fi
    if ! command -v -- "${editor_command[0]}" >/dev/null 2>&1; then
        echo "Éditeur introuvable : ${editor_command[0]} (définis VISUAL ou EDITOR)." >&2
        return 1
    fi
    "${editor_command[@]}" "$@"
}


# Prints the required google analytics code
google_analytics() {
    [[ -z $global_analytics && -z $global_analytics_file ]]  && return

    if [[ -z $global_analytics_file ]]; then
        echo "<script type=\"text/javascript\">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', '${global_analytics}']);
        _gaq.push(['_trackPageview']);

        (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();

        </script>"
    else
        cat "$global_analytics_file"
    fi
}

# Prints the required code for disqus comments
disqus_body() {
    [[ -z $global_disqus_username ]] && return

    echo '<div id="disqus_thread"></div>
            <script type="text/javascript">
            /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
               var disqus_shortname = '"'$global_disqus_username'"'; // required: replace example with your forum shortname

            /* * * DONT EDIT BELOW THIS LINE * * */
            (function() {
            var dsq = document.createElement("script"); dsq.type = "text/javascript"; dsq.async = true;
            dsq.src = "//" + disqus_shortname + ".disqus.com/embed.js";
            (document.getElementsByTagName("head")[0] || document.getElementsByTagName("body")[0]).appendChild(dsq);
            })();
            </script>
            <noscript>Active JavaScript pour afficher les <a href="http://disqus.com/?ref_noscript">commentaires gérés par Disqus.</a></noscript>
            <a href="http://disqus.com" class="dsq-brlink">Commentaires gérés par <span class="logo-disqus">Disqus</span></a>'
}

# Prints the required code for disqus in the footer
disqus_footer() {
    [[ -z $global_disqus_username ]] && return
    echo '<script type="text/javascript">
        /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
        var disqus_shortname = '"'$global_disqus_username'"'; // required: replace example with your forum shortname

        /* * * DONT EDIT BELOW THIS LINE * * */
        (function () {
        var s = document.createElement("script"); s.async = true;
        s.type = "text/javascript";
        s.src = "//" + disqus_shortname + ".disqus.com/count.js";
        (document.getElementsByTagName("HEAD")[0] || document.getElementsByTagName("BODY")[0]).appendChild(s);
    }());
    </script>'
}

# Reads HTML file from stdin, prints its content to stdout
# $1    where to start ("text" or "entry")
# $2    where to stop ("text" or "entry")
# $3    "cut" to remove text from <hr /> to <!-- text end -->
#       note that this does not remove <hr /> line itself,
#       so you can see if text was cut or not
get_html_file_content() {
    awk "/<!-- $1 begin -->/, /<!-- $2 end -->/{
        if (!/<!-- $1 begin -->/ && !/<!-- $2 end -->/) print
        if (\"$3\" == \"cut\" && /$cut_line/){
            if (\"$2\" == \"text\") exit # no need to read further
            while (getline > 0 && !/<!-- text end -->/) {
                if (\"$cut_tags\" == \"no\" && (/^<p>$template_tags_line_header/ || /^<p>Tags:/)) print
            }
        }
    }"
}

# Edit an existing, published .html file while keeping its original timestamp
# Please note that this function does not automatically republish anything, as
# it is usually called from 'main'.
#
# Note that it edits HTML file, even if you wrote the post as markdown originally
# Note that if you edit title then filename might also change
#
# $1 	the file to edit
# $2	(optional) edit mode:
#	"keep" to keep old filename
#	"full" to edit full HTML, and not only text part (keeps old filename)
#	leave empty for default behavior (edit only text part and change name)
edit() {
    local post_html="${1%.*}.html"
    [[ ! -f $post_html ]] && echo "Impossible de modifier « $post_html ». Pour publier un brouillon, utilise « bbnew post <fichier> »." >&2 && return 1
    # Original post timestamp
    edit_timestamp=$(LC_ALL=C date -r "$post_html" +"$date_format_full" )
    touch_timestamp=$(LC_ALL=C date -r "$post_html" +"$date_format_timestamp")
    created_timestamp=$(sed -n "s/.*<!-- $date_created_inpost: #\([^#]*\)# -->.*/\1/p" "$post_html" | head -n 1)
    [[ -n $created_timestamp ]] || created_timestamp=$(sed -n "s/.*<!-- $date_inpost: #\([^#]*\)# -->.*/\1/p" "$post_html" | head -n 1)
    tags_before=$(tags_in_post "$post_html")
    if [[ $2 == full ]]; then
        run_editor "$1" || return 1
        filename=$1
    else
        if [[ ${1##*.} == md ]]; then
            if ! test_markdown; then
                echo "Markdown ne fonctionne pas ; modifie directement le fichier HTML." >&2
                return 1
            fi
            # editing markdown file
            run_editor "$1" || return 1
            TMPFILE=$(markdown "$1") || {
                echo "Impossible de convertir « $1 » depuis Markdown ; le billet HTML n’a pas été régénéré." >&2
                return 1
            }
            filename=$post_html
        else
            # Create the content file
            TMPFILE=$(mktemp ./.bb-edit-content.XXXXXX) || return 1
            # Title
            get_post_title "$1" > "$TMPFILE"
            # Post text with plaintext tags
            get_html_file_content 'text' 'text' <"$1" | sed \
                -e "/^<p>$template_tags_line_header/s|<a href='$prefix_tags\([^']*\).html'>\\1</a>|\\1|g" \
                -e "/^<p>$legacy_tags_line_header/s|<a href='$prefix_tags\([^']*\).html'>\\1</a>|\\1|g" >> "$TMPFILE"
            run_editor "$TMPFILE" || {
                echo "L’éditeur a échoué ; le brouillon est conservé dans « $TMPFILE »." >&2
                delete_includes
                return 1
            }
            filename=$1
        fi
        old_filename=$filename
        backupfile=""
        if [[ -e $old_filename ]]; then
            backupfile=$(mktemp "${old_filename}.backup.XXXXXX") || { rm -f -- "$TMPFILE"; return 1; }
            if ! mv -f -- "$old_filename" "$backupfile"; then
                rm -f -- "$backupfile" "$TMPFILE"
                return 1
            fi
        fi
        parse_status=0
        generated_output=""
        if [[ $2 == keep ]]; then
            if parse_file "$TMPFILE" "$edit_timestamp" "$old_filename"; then
                generated_output=$old_filename
            else
                parse_status=1
            fi
        else
            if parse_file "$TMPFILE" "$edit_timestamp"; then
                generated_output=$filename
            else
                parse_status=1
            fi
            if ((parse_status == 0)) && [[ ${1##*.} == md ]]; then
                mv -f -- "$1" "${filename%.html}.md" 2>/dev/null || parse_status=1
            fi
        fi
        rm -f -- "$TMPFILE"
        if ((parse_status != 0)); then
            [[ -n $generated_output ]] && rm -f -- "$generated_output"
            if [[ -n $backupfile ]]; then
                mv -f -- "$backupfile" "$old_filename" || echo "Impossible de restaurer « $old_filename » depuis « $backupfile »." >&2
            fi
            return 1
        fi
        [[ -n $backupfile ]] && rm -f -- "$backupfile"
    fi
    touch -t "$touch_timestamp" "$filename" || return 1
    markdown_source=$1
    if [[ ! -e $markdown_source && ${1##*.} == md ]]; then
        markdown_source=${filename%.html}.md
    fi
    [[ ! -e $markdown_source ]] || touch -t "$touch_timestamp" "$markdown_source" || return 1
    chmod 644 "$filename" || return 1
    echo "Billet publié : $filename"
    tags_after=$(tags_in_post "$filename")
    relevant_tags=$(echo "$tags_before $tags_after" | tr ',' ' ' | tr ' ' '\n' | sort -u | tr '\n' ' ')
    if [[ ! -z $relevant_tags ]]; then
        local -a relevant_tag_array=()
        read -r -a relevant_tag_array <<< "$relevant_tags"
        relevant_posts=$(posts_with_tags "${relevant_tag_array[@]}")
        relevant_posts+=$'\n'"$filename"
        rebuild_tags "$relevant_posts" "$relevant_tags" || return 1
    fi
}

# Create a Twitter summary (twitter "card") for the post
#
# $1 the post file
# $2 the title
twitter_card() {
    [[ -z $global_twitter_username ]] && return
    
    echo "<meta name='twitter:card' content='summary' />"
    echo "<meta name='twitter:site' content='@$global_twitter_username' />"
    echo "<meta name='twitter:title' content='$2' />" # Twitter truncates at 70 char
    if ! description=$(set -o pipefail; awk -v tags_header="^<p>$template_tags_line_header" \
        '$0 !~ tags_header && $0 !~ /^<p>Tags:/' "$1" | sed -e 's/<[^>]*>//g' | tr '\n' ' ' |
        sed "s/\"/'/g" | awk '{ printf "%s", substr($0, 1, 250) }'); then
        return 1
    fi
    echo "<meta name='twitter:description' content=\"$description\" />"

    # For the image we try to locate the first image in the article
    image=$(sed -n '2,$ d; s/.*<img.*src="\([^"]*\)".*/\1/p' "$1") || return 1

    # If none, then we try a global setting image
    [[ -z $image ]] && [[ -n $global_twitter_card_image ]] && image=$global_twitter_card_image

    # If none, return
    [[ -z $image ]] && return

    # Final housekeeping
    [[ $image =~ ^https?:// ]] || image=$global_url/$image # Check that URL is absolute
    echo "<meta name='twitter:image' content='$image' />"
}

# Adds the code needed by the twitter button
#
# $1 the post URL
twitter() {
    [[ -z $global_twitter_username ]] && return

    if [[ -z $global_disqus_username ]]; then
        if [[ $global_twitter_cookieless == true ]]; then 
            id=$RANDOM

            search_engine="https://twitter.com/search?q="

            echo "<p id='twitter'><a href='http://twitter.com/intent/tweet?url=$1&text=$template_twitter_comment&via=$global_twitter_username'>$template_comments $template_twitter_button</a> "
            echo "<a href='$search_engine""$1'><span id='count-$id'></span></a>&nbsp;</p>"
            return;
        else 
            echo "<p id='twitter'>$template_comments&nbsp;"; 
        fi
    else
        echo "<p id='twitter'><a href=\"$1#disqus_thread\">$template_comments</a> &nbsp;"
    fi  

    echo "<a href=\"https://twitter.com/share\" class=\"twitter-share-button\" data-text=\"$template_twitter_comment\" data-url=\"$1\""
    echo " data-via=\"$global_twitter_username\""
    echo ">$template_twitter_button</a>	<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=\"//platform.twitter.com/widgets.js\";fjs.parentNode.insertBefore(js,fjs);}}(document,\"script\",\"twitter-wjs\");</script>"
    echo "</p>"
}

# Check if the file is a 'boilerplate' (i.e. not a post)
# The return values are designed to be used like this inside a loop:
# is_boilerplate_file <file> && continue
#
# $1 the file
#
# Return 0 (bash return value 'true') if the input file is an index, feed, etc
# or 1 (bash return value 'false') if it is a blogpost
is_boilerplate_file() {
    name=${1#./}
    # Pages created by the `page` command are static content, not blog posts.
    if [[ -f $1 ]] && grep -Fq '<!-- bashblog_page -->' "$1"; then
        return 0
    fi
    # First check against user-defined non-blogpost pages
    for item in "${non_blogpost_files[@]}"; do
        [[ "$name" == "$item" ]] && return 0
    done

    case $name in
    ( "$index_file" | "$archive_index" | "$tags_index" | "$footer_file" | "$header_file" | "$global_analytics_file" | "$prefix_tags"* )
        return 0 ;;
    ( * ) # Check for excluded
        for excl in "${html_exclude[@]}"; do
            [[ $name == "$excl" ]] && return 0
        done
        return 1 ;;
    esac
}

# Sort by original creation time, then use the publication date for older posts.
sort_posts_by_created() {
    local post key
    local -a keyed_posts=()
    for post in "$@"; do
        [[ -f $post ]] || continue
        key=$(sed -n "s/.*<!-- $date_created_inpost: #\([^#]*\)# -->.*/\1/p" "$post" | head -n 1)
        [[ -n $key ]] || key=$(sed -n "s/.*<!-- $date_inpost: #\([^#]*\)# -->.*/\1/p" "$post" | head -n 1)
        [[ -n $key ]] || key=$(LC_ALL=C date -r "$post" +"$date_format_timestamp")
        keyed_posts+=("$key$(printf '\t')$post")
    done
    if ((${#keyed_posts[@]})); then
        (set -o pipefail; printf '%s\n' "${keyed_posts[@]}" | LC_ALL=C sort -t $'\t' -k1,1r -k2,2r | cut -f2-)
    fi
}

# Adds all the bells and whistles to format the html page
# Every blog post is marked with a <!-- entry begin --> and <!-- entry end -->
# which is parsed afterwards in the other functions. There is also a marker
# <!-- text begin --> to determine just the beginning of the text body of the post
#
# $1     a file with the body of the content
# $2     the output file
# $3     "yes" if we want to generate the index.html,
#        "no" to insert new blog posts
# $4     title for the html header
# $5     original blog timestamp
# $6     post author
create_html_page() {
    content=$1
    filename=$2
    output_target=${7:-$filename}
    index=$3
    title=$4
    timestamp=$5
    author=$6
    local temp_output
    temp_output=$(mktemp "${filename}.XXXXXX") || return 1

    # Create the actual blog post
    # html, head
    {
        cat ".header.html" || { rm -f -- "$temp_output"; return 1; }
        echo "<title>$title</title>"
        google_analytics || { rm -f -- "$temp_output"; return 1; }
        twitter_card "$content" "$title" || { rm -f -- "$temp_output"; return 1; }
        echo "</head><body>"
        # stuff to add before the actual body content
        [[ -z $body_begin_file ]] || cat "$body_begin_file" || { rm -f -- "$temp_output"; return 1; }
        if [[ $output_target == "$index_file" && -n $body_begin_file_index ]]; then
            cat "$body_begin_file_index" || { rm -f -- "$temp_output"; return 1; }
        fi
        # body divs
        echo '<div id="divbodyholder">'
        echo '<div class="headerholder"><div class="header">'
        # blog title
        echo '<div id="title">'
        cat .title.html || { rm -f -- "$temp_output"; return 1; }
        echo '</div></div></div>' # title, header, headerholder
        echo '<div id="divbody"><div class="content">'

        file_url=${filename#./}
        file_url=${file_url%.rebuilt} # Get the correct URL when rebuilding
        # one blog entry
        if [[ $index == no ]]; then
            echo '<!-- entry begin -->' # marks the beginning of the whole post
            echo "<h3><a class=\"ablack\" href=\"$file_url\">"
            # remove possible <p>'s on the title because of markdown conversion
            title=${title//<p>/}
            title=${title//<\/p>/}
            echo "$title"
            echo '</a></h3>'
            if [[ -z $timestamp ]]; then
                echo "<!-- $date_inpost: #$(LC_ALL=$date_locale date +"$date_format_timestamp")# -->"
            else
                echo "<!-- $date_inpost: #$(LC_ALL=$date_locale date +"$date_format_timestamp" --date="$timestamp")# -->"
            fi
            [[ -n $created_timestamp ]] || created_timestamp=$(LC_ALL=C date +"$date_format_timestamp")
            echo "<!-- $date_created_inpost: #$created_timestamp# -->"
            if [[ -z $timestamp ]]; then
                echo -n "<div class=\"subtitle\">$(LC_ALL=$date_locale date +"$date_format")"
            else
                echo -n "<div class=\"subtitle\">$(LC_ALL=$date_locale date +"$date_format" --date="$timestamp")"
            fi
            [[ -n $author ]] && printf ' &mdash; \n%s\n' "$author"
            echo "</div>"
            echo '<!-- text begin -->' # This marks the text body, after the title, date...
        fi
        cat "$content" || { rm -f -- "$temp_output"; return 1; } # Actual content
        if [[ $index == no ]]; then
            printf '\n<!-- text end -->\n'

            twitter "$global_url/$file_url" || { rm -f -- "$temp_output"; return 1; }

            echo '<!-- entry end -->' # absolute end of the post
        fi

        if [[ $index == no && -n $comments_file && -f $comments_file ]]; then
            echo '<section id="comments" aria-label="Commentaires">'
            cat "$comments_file" || { rm -f -- "$temp_output"; return 1; }
            echo '</section>'
        fi

        echo '</div>' # content

        # Add disqus commments except for index and all_posts pages
        [[ $index != no ]] || disqus_body || { rm -f -- "$temp_output"; return 1; }

        # page footer
        cat .footer.html || { rm -f -- "$temp_output"; return 1; }
        # close divs
        echo '</div></div>' # divbody and divbodyholder 
        disqus_footer || { rm -f -- "$temp_output"; return 1; }
        [[ -z $body_end_file ]] || cat "$body_end_file" || { rm -f -- "$temp_output"; return 1; }
        echo '</body></html>'
    } > "$temp_output" || { rm -f -- "$temp_output"; return 1; }
    if ! mv -f -- "$temp_output" "$filename"; then
        rm -f -- "$temp_output"
        return 1
    fi
}

# Parse the plain text file into an html file
#
# $1    source file name
# $2    (optional) timestamp for the file
# $3    (optional) destination file name
# note that although timestamp is optional, something must be provided at its
# place if destination file name is provided, i.e:
# parse_file source.txt "" destination.html
parse_file() {
    # Read for the title and check that the filename is ok
    title=""
    content=$(mktemp ./.bb-post-content.XXXXXX) || return 1
    while IFS='' read -r line; do
        if [[ -z $title ]]; then
            # remove extra <p> and </p> added by markdown
            title=$(echo "$line" | sed 's/<\/*p>//g')
            if [[ -n $3 ]]; then
                filename=$3
            else
                filename=$title
                [[ -n $convert_filename ]] &&
                    filename=$(printf '%s\n' "$title" | eval "$convert_filename")
                [[ -n $filename ]] || 
                    filename=$RANDOM # don't allow empty filenames

                if [[ $filename == */* || $filename == . || $filename == .. ]]; then
                    echo "Le titre produit un nom de fichier invalide : « $filename »." >&2
                    rm -f -- "$content"
                    return 1
                fi

                filename=$filename.html

                # Check for duplicate file names
                while [[ -f $filename ]]; do
                    filename=${filename%.html}$RANDOM.html
                done
            fi
        # Parse possible tags
        elif [[ $line == "<p>$template_tags_line_header"* || $line == "<p>$legacy_tags_line_header"* ]]; then
            tags=$(echo "$line" | cut -d ":" -f 2- | sed -e 's/<\/p>//g' -e 's/^ *//' -e 's/ *$//' -e 's/, /,/g')
            IFS=, read -r -a array <<< "$tags"

            tag_html=""
            for item in "${array[@]}"; do
                [[ -z $item ]] && continue
                if [[ ! $item =~ ^[[:alnum:]_-]+$ ]]; then
                    echo "Étiquette invalide « $item » : utilise uniquement des lettres, chiffres, tirets et tirets bas." >&2
                    rm -f -- "$content"
                    return 1
                fi
                tag_html+="<a href='$prefix_tags$item.html'>$item</a>, "
            done
            tag_html=${tag_html%, }
            printf '<p>%s %s</p>\n' "$template_tags_line_header" "$tag_html" >> "$content"
        else
            echo "$line" >> "$content"
        fi
    done < "$1"

    # Give posts without an explicit separator a useful front-page excerpt.
    # Cutting after the first rendered paragraph keeps the boundary aligned
    # with the article's structure and avoids splitting words or HTML tags.
    if [[ -n $cut_do ]] && ! grep -Eq '<!--[[:space:]]*more[[:space:]]*-->|<hr ?/?>' "$content"; then
        local excerpt_content
        excerpt_content=$(mktemp ./.bb-post-excerpt.XXXXXX) || { rm -f -- "$content"; return 1; }
        awk -v tags_header="$template_tags_line_header" -v legacy_header="$legacy_tags_line_header" '
            !inserted && /<\/p>/ && $0 !~ "^<p>" tags_header && $0 !~ "^<p>" legacy_header {
                print
                print "<!-- more -->"
                inserted=1
                next
            }
            { print }
        ' "$content" > "$excerpt_content" || { rm -f -- "$content" "$excerpt_content"; return 1; }
        mv -f -- "$excerpt_content" "$content" || { rm -f -- "$content" "$excerpt_content"; return 1; }
    fi

    # Create the actual html page
    create_html_page "$content" "$filename" no "$title" "$2" "$global_author"
    local status=$?
    rm -f -- "$content"
    return "$status"
}

# Manages the creation of the text file and the parsing to html file
# also the drafts
write_entry() {
    test_markdown && fmt=md || fmt=html
    f=$2
    [[ $2 == -html ]] && fmt=html && f=$3

    if [[ -n $f ]]; then
        TMPFILE=$f
        if [[ ! -f $TMPFILE ]]; then
            echo "Le fichier n’existe pas." >&2
            delete_includes
            exit
        fi
        # guess format from TMPFILE
        extension=${TMPFILE##*.}
        [[ $extension == md || $extension == html ]] && fmt=$extension
        # but let user override it (`bb.sh post -html file.md`)
        [[ $2 == -html ]] && fmt=html
        # Test if Markdown is working before re-posting a .md file
        if [[ $extension == md ]]; then
            if ! test_markdown; then
                echo "Markdown ne fonctionne pas ; modifie directement le fichier HTML." >&2
                exit
            fi
        fi
    else
        TMPFILE=.entry-$RANDOM.$fmt
        printf 'Titre sur cette ligne\n\n' >> "$TMPFILE"

        [[ $fmt == html ]] && cat << EOF >> "$TMPFILE"
<p>La suite de ce fichier constitue le billet en <b>HTML</b>. La publication reprendra
à la fermeture de l’éditeur.</p>

<p>$template_tags_line_header keep-this-tag-format, tags-are-optional, example</p>
EOF
        [[ $fmt == md ]] && cat << EOF >> "$TMPFILE"
La suite de ce fichier constitue le billet en **Markdown**. La publication reprendra
à la fermeture de l’éditeur.

$template_tags_line_header keep-this-tag-format, tags-are-optional, beware-with-underscores-in-markdown, example
EOF
    fi
    chmod 600 "$TMPFILE"

    post_status="E"
    filename=""
    while [[ $post_status != "p" && $post_status != "P" ]]; do
        [[ -n $filename ]] && rm -f -- "$filename" # Delete the generated html file, if any
        run_editor "$TMPFILE" || {
                echo "L’éditeur a échoué ; le brouillon est conservé dans « $TMPFILE »." >&2
                delete_includes
                return 1
            }
        if [[ $fmt == md ]]; then
            html_from_md=$(markdown "$TMPFILE") || {
                echo "Impossible de convertir le brouillon Markdown ; le brouillon a été conservé." >&2
                delete_includes
                return 1
            }
            parse_file "$html_from_md" || { rm -f -- "$html_from_md"; return 1; }
            rm -f -- "$html_from_md"
        else
            parse_file "$TMPFILE" || return 1 # sets filename to the generated page
        fi

        chmod 644 "$filename"
        [[ -n $preview_url ]] || preview_url=$global_url
        echo "Aperçu du billet : ouvre $preview_url/$filename dans ton navigateur."

        echo -n "[P]ublier, [M]odifier encore, [B]rouillon ? (p/m/b) "
        read -r post_status
        if [[ $post_status == b || $post_status == B ]]; then
            mkdir -p "drafts/"
            chmod 700 "drafts/"

            title=$(head -n 1 "$TMPFILE")
            [[ -n $convert_filename ]] && title=$(printf '%s\n' "$title" | eval "$convert_filename")
            [[ -n $title ]] || title=$RANDOM
            if [[ $title == */* || $title == . || $title == .. ]]; then
                echo "Le titre produit un nom de brouillon invalide : « $title »." >&2
                delete_includes
                return 1
            fi

            draft=drafts/$title.$fmt
            while [[ -e $draft ]]; do draft="drafts/$title.$RANDOM.$fmt"; done
            mv -n -- "$TMPFILE" "$draft"
            if [[ -e $TMPFILE ]]; then
                echo "Impossible d’enregistrer le brouillon sans écraser un fichier existant." >&2
                delete_includes
                return 1
            fi
            chmod 600 "$draft"
            rm -f -- "$filename"
            delete_includes
            echo "Brouillon enregistré dans « $draft »."
            exit
        fi
    done

    if [[ $fmt == md && -n $save_markdown ]]; then
        mv -f -- "$TMPFILE" "${filename%.html}.md" || return 1
    else
        rm -f -- "$TMPFILE" || return 1
    fi
    chmod 644 "$filename" || return 1
    echo "Billet publié : $filename"
    relevant_tags=$(tags_in_post "$filename")
    if [[ -n $relevant_tags ]]; then
        local -a relevant_tag_array=()
        read -r -a relevant_tag_array <<< "$relevant_tags"
        relevant_posts=$(posts_with_tags "${relevant_tag_array[@]}")
        relevant_posts+=$'\n'"$filename"
        rebuild_tags "$relevant_posts" "$relevant_tags" || return 1
    fi
}

# Create or update a static page from a Markdown or HTML draft.
# The first line is the page title; the remaining lines are its content.
write_page() {
    local source=${1:-} source_is_temporary=0 title page_slug target markdown_target
    local body_source rendered content_file source_format preview_file page_status preview_url draft

    if [[ -z $source ]]; then
        source=$(mktemp ./.bb-page-draft.XXXXXX) || return 1
        source_is_temporary=1
        if test_markdown; then
            source_format=md
            printf 'Titre de la page\n\nÉcris le contenu de la page ici.\n' > "$source" || {
                rm -f -- "$source"
                return 1
            }
        else
            source_format=html
            printf 'Titre de la page\n\n<p>Écris le contenu HTML de la page ici.</p>\n' > "$source" || {
                rm -f -- "$source"
                return 1
            }
        fi
        chmod 600 "$source" || { rm -f -- "$source"; return 1; }
    else
        if [[ ! -f $source ]]; then
            echo "Le fichier source « $source » n’existe pas." >&2
            return 1
        fi
        case ${source##*.} in
            md)
                source_format=md
                if ! test_markdown; then
                    echo "Markdown ne fonctionne pas ; crée une page avec « page » et saisis le contenu en HTML." >&2
                    return 1
                fi
                ;;
            html)
                if [[ $source != drafts/* ]]; then
                    echo "Un brouillon HTML doit se trouver dans le dossier « drafts/ »." >&2
                    return 1
                fi
                source_format=html
                ;;
            *)
                echo "La commande page attend un fichier .md ou un brouillon HTML dans « drafts/ »." >&2
                return 1
                ;;
        esac
    fi

    page_status="E"
    while [[ $page_status != p && $page_status != P ]]; do
        run_editor "$source" || {
            echo "L’éditeur a échoué ; le brouillon est conservé dans « $source »." >&2
            return 1
        }
        IFS= read -r title < "$source" || :
        if [[ -z ${title//[[:space:]]/} ]]; then
            echo "La première ligne doit contenir le titre de la page." >&2
            return 1
        fi
        page_slug=$title
        if [[ -n $convert_filename ]]; then
            page_slug=$(printf '%s\n' "$title" | eval "$convert_filename") || return 1
        fi
        if [[ -z $page_slug || $page_slug == */* || $page_slug == . || $page_slug == .. ]]; then
            echo "Le titre produit un nom de page invalide : « $page_slug »." >&2
            return 1
        fi
        target=$page_slug.html
        if [[ -e $target ]] && ! grep -Fq '<!-- bashblog_page -->' "$target"; then
            echo "Le fichier « $target » existe et n’est pas une page créée par cette commande." >&2
            return 1
        fi

        markdown_target=$page_slug.md
        if [[ $source_format == md && -n $save_markdown && $page_status == p &&
              -e $markdown_target && $source != "$markdown_target" ]]; then
            echo "Le fichier Markdown « $markdown_target » existe déjà ; le brouillon n’a pas été déplacé." >&2
            return 1
        fi

        body_source=$(mktemp ./.bb-page-body.XXXXXX) || return 1
        rendered=""
        content_file=$(mktemp ./.bb-page-content.XXXXXX) || { rm -f -- "$body_source"; return 1; }
        if ! tail -n +2 "$source" > "$body_source"; then
            rm -f -- "$body_source" "$content_file"
            return 1
        fi
        if [[ $source_format == md ]]; then
            rendered=$(markdown "$body_source") || {
                rm -f -- "$body_source" "$content_file"
                return 1
            }
            if ! { printf '<!-- bashblog_page -->\n'; cat -- "$rendered"; } > "$content_file"; then
                rm -f -- "$body_source" "$content_file" "$rendered"
                return 1
            fi
            rm -f -- "$rendered" || { rm -f -- "$body_source" "$content_file"; return 1; }
        else
            if ! { printf '<!-- bashblog_page -->\n'; cat -- "$body_source"; } > "$content_file"; then
                rm -f -- "$body_source" "$content_file"
                return 1
            fi
        fi
        rm -f -- "$body_source" || { rm -f -- "$content_file"; return 1; }

        preview_file=$(mktemp "./page-preview-${page_slug}.XXXXXX.html") || { rm -f -- "$content_file"; return 1; }
        if ! create_html_page "$content_file" "$preview_file" yes "$title" || ! chmod 644 "$preview_file"; then
            rm -f -- "$content_file" "$preview_file"
            return 1
        fi
        rm -f -- "$content_file" || { rm -f -- "$preview_file"; return 1; }
        [[ -n $preview_url ]] || preview_url=$global_url
        echo "Aperçu de la page : ouvre $preview_url/${preview_file#./} dans ton navigateur."
        echo -n "[P]ublier, [M]odifier encore, [B]rouillon ? (p/m/b) "
        read -r page_status || { rm -f -- "$preview_file"; return 1; }

        case $page_status in
            p|P)
                mv -f -- "$preview_file" "$target" || { rm -f -- "$preview_file"; return 1; }
                chmod 644 "$target" || return 1
                if [[ $source_format == md && -n $save_markdown && $source != "$markdown_target" ]]; then
                    mv -f -- "$source" "$markdown_target" || return 1
                    source_is_temporary=0
                elif [[ $source_format == html && $source != .bb-page-draft.* ]]; then
                    rm -f -- "$source" || return 1
                fi
                if ((source_is_temporary)); then rm -f -- "$source" || return 1; fi
                echo "Page publiée : $target"
                return 0
                ;;
            b|B)
                mkdir -p drafts || { rm -f -- "$preview_file"; return 1; }
                chmod 700 drafts || { rm -f -- "$preview_file"; return 1; }
                draft=drafts/$page_slug.$source_format
                if [[ $source != "$draft" ]]; then
                    while [[ -e $draft ]]; do draft="drafts/$page_slug.$RANDOM.$source_format"; done
                    mv -n -- "$source" "$draft" || { rm -f -- "$preview_file"; return 1; }
                    if [[ -e $source ]]; then
                        echo "Impossible d’enregistrer le brouillon sans écraser un fichier existant." >&2
                        rm -f -- "$preview_file"
                        return 1
                    fi
                fi
                chmod 600 "$draft" || { rm -f -- "$preview_file"; return 1; }
                rm -f -- "$preview_file" || return 1
                echo "Brouillon enregistré dans « $draft »."
                return 3
                ;;
            *)
                rm -f -- "$preview_file" || return 1
                ;;
        esac
    done
}

# Create an index page with all the posts
all_posts() {
    echo -n "Création de l’archive des billets "
    contentfile=$(mktemp "./.${archive_index}.content.XXXXXX") || return 1
    outputfile=$(mktemp "./.${archive_index}.html.XXXXXX") || { rm -f -- "$contentfile"; return 1; }

    {
        echo "<h3>$template_archive_title</h3>"
        prev_month=""
        while IFS='' read -r i; do
            is_boilerplate_file "$i" && continue
            echo -n "." 1>&3
            # Month headers
            month=$(LC_ALL=$date_locale date -r "$i" +"$date_allposts_header")
            if [[ $month != "$prev_month" ]]; then
                [[ -n $prev_month ]] && echo "</ul>"  # Don't close ul before first header
                echo "<h4 class='allposts_header'>$month</h4>"
                echo "<ul>"
                prev_month=$month
            fi
            # Title
            title=$(get_post_title "$i")
            echo -n "<li><a href=\"$i\">$title</a> &mdash;"
            # Date
            date=$(LC_ALL=$date_locale date -r "$i" +"$date_format")
            echo " $date</li>"
        done < <(sort_posts_by_created ./*.html)
        echo "" 1>&3
        echo "</ul>"
        echo "<div id=\"all_posts\"><a href=\"./$index_file\">$template_archive_index_page</a></div>"
    } 3>&1 >"$contentfile"

    create_html_page "$contentfile" "$outputfile" yes "$global_title &mdash; $template_archive_title" "$global_author" || {
        rm -f -- "$contentfile" "$outputfile"
        return 1
    }
    mv -f -- "$outputfile" "$archive_index" || { rm -f -- "$contentfile" "$outputfile"; return 1; }
    chmod 644 "$archive_index" || { rm -f -- "$contentfile"; return 1; }
    rm -f -- "$contentfile" || return 1
}

# Create an index page with all the tags
all_tags() {
    echo -n "Création de l’index des étiquettes "
    contentfile=$(mktemp "./.${tags_index}.content.XXXXXX") || return 1
    outputfile=$(mktemp "./.${tags_index}.html.XXXXXX") || { rm -f -- "$contentfile"; return 1; }

    {
        echo "<h3>$template_tags_title</h3>"
        echo "<ul>"
        for i in "$prefix_tags"*.html; do
            [[ -f "$i" ]] || break
            echo -n "." 1>&3
            nposts=$(grep -c "<!-- text begin -->" "$i")
            tagname=${i#"$prefix_tags"}
            tagname=${tagname%.html}
            case $nposts in
                1) word=$template_tags_posts_singular;;
                2|3|4) word=$template_tags_posts_2_4;;
                *) word=$template_tags_posts;;
            esac
            echo "<li><a href=\"$i\">$tagname</a> &mdash; $nposts $word</li>"
        done
        echo "" 1>&3
        echo "</ul>"
        echo "<div id=\"all_posts\"><a href=\"./$index_file\">$template_archive_index_page</a></div>"
    } 3>&1 > "$contentfile"

    create_html_page "$contentfile" "$outputfile" yes "$global_title &mdash; $template_tags_title" "$global_author" || {
        rm -f -- "$contentfile" "$outputfile"
        return 1
    }
    mv -f -- "$outputfile" "$tags_index" || { rm -f -- "$contentfile" "$outputfile"; return 1; }
    chmod 644 "$tags_index" || { rm -f -- "$contentfile"; return 1; }
    rm -f -- "$contentfile" || return 1
}

# Generate the index.html with the content of the latest posts
rebuild_index() {
    echo -n "Reconstruction de la page d’accueil "
    newindexfile=$(mktemp "./.${index_file}.html.XXXXXX") || return 1
    contentfile=$(mktemp "./.${index_file}.content.XXXXXX") || { rm -f -- "$newindexfile"; return 1; }

    # Create the content file
    {
        n=0
        while IFS='' read -r i; do
            is_boilerplate_file "$i" && continue;
            if ((n >= number_of_index_articles)); then break; fi
            if [[ -n $cut_do ]]; then
                if ! (set -o pipefail; get_html_file_content 'entry' 'entry' 'cut' <"$i" |
                    awk -v cut_line="${cut_line//\\\//\/}" -v filename="$i" -v read_more="$template_read_more" \
                        '$0 ~ cut_line { print "<p class=\"readmore\"><a href=\"" filename "\">" read_more "</a></p>"; next } 1'); then
                    echo "Échec de la lecture du billet « $i » pendant la reconstruction de l’accueil." >&2
                    rm -f -- "$contentfile" "$newindexfile"
                    return 1
                fi
            else
                get_html_file_content 'entry' 'entry' <"$i" || {
                    rm -f -- "$contentfile" "$newindexfile"
                    return 1
                }
            fi
            echo -n "." 1>&3
            n=$(( n + 1 ))
        done < <(sort_posts_by_created ./*.html) # newest post first

        feed=$blog_feed
        if [[ -n $global_feedburner ]]; then feed=$global_feedburner; fi
        echo "<div id=\"all_posts\"><a href=\"$archive_index\">$template_archive</a> &mdash; <a href=\"$tags_index\">$template_tags_title</a> &mdash; <a href=\"$feed\">$template_subscribe</a></div>"
    } 3>&1 >"$contentfile"

    echo ""

    create_html_page "$contentfile" "$newindexfile" yes "$global_title" "$global_author" "$index_file" || {
        rm -f -- "$contentfile" "$newindexfile"
        return 1
    }
    rm -f -- "$contentfile"
    mv -f -- "$newindexfile" "$index_file" || { rm -f -- "$newindexfile"; return 1; }
    chmod 644 "$index_file" || return 1
}

# Finds all tags referenced in one post.
# Accepts either filename as first argument, or post content at stdin
# Prints one line with space-separated tags to stdout
tags_in_post() {
    (set -o pipefail; sed -n \
        -e "/^<p>$template_tags_line_header/{s/^<p>$template_tags_line_header//;s/<[^>]*>//g;s/[ ,]\+/ /g;p;}" \
        -e "/^<p>$legacy_tags_line_header/{s/^<p>$legacy_tags_line_header//;s/<[^>]*>//g;s/[ ,]\+/ /g;p;}" "$1" |
        tr ', ' ' ')
}

# Finds all posts referenced in a number of tags.
# Arguments are tags
# Prints one line with space-separated tags to stdout
posts_with_tags() {
    (($# < 1)) && return
    set -- "${@/#/$prefix_tags}"
    set -- "${@/%/.html}"
    sed -n '/^<h3><a class="ablack" href="[^"]*">/{s/.*href="\([^"]*\)">.*/\1/;p;}' "$@" 2> /dev/null
}

# Rebuilds tag_*.html files
# if no arguments given, rebuilds all of them
# if arguments given, they should have this format:
# "FILE1 [FILE2 [...]]" "TAG1 [TAG2 [...]]"
# where FILEn are files with posts which should be used for rebuilding tags,
# and TAGn are names of tags which should be rebuilt.
# example:
# rebuild_tags "one_post.html another_article.html" "example-tag another-tag"
# mind the quotes!
rebuild_tags() {
    local -a file_list=()
    local -a affected_tags=() old_tag_files=() installed_tag_files=() staged_tag_files=()
    local all_tags="" tags="" stage_dir post_content post_path post_tags tag tagname old_file staged_file sorted_posts
    local rollback_failed=0
    if (($# < 2)); then
        # Keep paths in an array so spaces survive sorting and processing.
        for i in ./*.html; do [[ -f $i ]] && file_list+=("$i"); done
        if ((${#file_list[@]})); then
            local -a sorted_files=()
            sorted_posts=$(sort_posts_by_created "${file_list[@]}") || return 1
            while IFS= read -r post_path; do sorted_files+=("$post_path"); done <<< "$sorted_posts"
            file_list=("${sorted_files[@]}")
        fi
        all_tags=yes
    else
        # The internal API passes a newline-separated list of file paths.
        sorted_posts=$(printf '%s\n' "$1" | sort -u) || return 1
        while IFS= read -r post_path; do
            [[ -n $post_path && -f $post_path ]] && file_list+=("$post_path")
        done <<< "$sorted_posts"
        if ((${#file_list[@]})); then
            local -a sorted_files=()
            sorted_posts=$(sort_posts_by_created "${file_list[@]}") || return 1
            while IFS= read -r post_path; do sorted_files+=("$post_path"); done <<< "$sorted_posts"
            file_list=("${sorted_files[@]}")
        fi
        tags=$2
    fi
    echo -n "Reconstruction des pages d’étiquettes "
    if [[ -n $all_tags ]]; then
        for post_path in "${file_list[@]}"; do
            is_boilerplate_file "$post_path" && continue
            post_tags=$(tags_in_post "$post_path") || return 1
            for tag in $post_tags; do
                [[ $tag =~ ^[[:alnum:]_-]+$ ]] || continue
                [[ " ${affected_tags[*]} " == *" $tag "* ]] || affected_tags+=("$tag")
            done
        done
        for post_path in "./$prefix_tags"*.html; do
            [[ -f $post_path ]] && old_tag_files+=("$post_path")
        done
    else
        for tag in $tags; do
            [[ $tag =~ ^[[:alnum:]_-]+$ ]] || continue
            [[ " ${affected_tags[*]} " == *" $tag "* ]] || affected_tags+=("$tag")
            [[ -f ./$prefix_tags$tag.html ]] && old_tag_files+=("./$prefix_tags$tag.html")
        done
    fi

    # Render every replacement in a private staging directory before moving
    # any current tag page out of the way.
    stage_dir=$(mktemp -d ./.bb-tags.XXXXXX) || return 1
    post_content=$stage_dir/post-content
    if ! : >"$post_content"; then
        rm -rf -- "$stage_dir"
        return 1
    fi
    for tag in "${affected_tags[@]}"; do
        if ! : >"$stage_dir/$prefix_tags$tag.content"; then
            rm -rf -- "$stage_dir"
            return 1
        fi
    done

    for post_path in "${file_list[@]}"; do
        is_boilerplate_file "$post_path" && continue
        echo -n "."
        if [[ -n $cut_do ]]; then
            if ! (set -o pipefail; get_html_file_content 'entry' 'entry' 'cut' <"$post_path" |
                awk -v cut_line="${cut_line//\\\//\/}" -v filename="$post_path" -v read_more="$template_read_more" \
                    '$0 ~ cut_line { print "<p class=\"readmore\"><a href=\"" filename "\">" read_more "</a></p>"; next } 1') >"$post_content"; then
                echo "Échec de la lecture du billet « $post_path » pendant la reconstruction des étiquettes." >&2
                rm -rf -- "$stage_dir"
                return 1
            fi
        elif ! get_html_file_content 'entry' 'entry' <"$post_path" >"$post_content"; then
            echo "Échec de la lecture du billet « $post_path » pendant la reconstruction des étiquettes." >&2
            rm -rf -- "$stage_dir"
            return 1
        fi
        post_tags=$(tags_in_post "$post_path") || {
            echo "Échec de la lecture des étiquettes du billet « $post_path »." >&2
            rm -rf -- "$stage_dir"
            return 1
        }
        for tag in $post_tags; do
            if [[ ! $tag =~ ^[[:alnum:]_-]+$ ]]; then
                echo "Étiquette risquée « $tag » ignorée dans « $post_path »." >&2
                continue
            fi
            if [[ -n $all_tags || " $tags " == *" $tag "* ]]; then
                cat -- "$post_content" >>"$stage_dir/$prefix_tags$tag.content" || {
                    echo "Échec de l’écriture du contenu de l’étiquette « $tag »." >&2
                    rm -rf -- "$stage_dir"
                    return 1
                }
            fi
        done
    done

    for tag in "${affected_tags[@]}"; do
        [[ -s $stage_dir/$prefix_tags$tag.content ]] || continue
        staged_file=$stage_dir/$prefix_tags$tag.html
        create_html_page "$stage_dir/$prefix_tags$tag.content" "$staged_file" yes \
            "$global_title &mdash; $template_tag_title \"$tag\"" "$global_author" || {
                echo "Échec de la génération de la page d’étiquette « $tag » ; les pages existantes sont préservées." >&2
                rm -rf -- "$stage_dir"
                return 1
            }
        chmod 644 "$staged_file" || { rm -rf -- "$stage_dir"; return 1; }
        staged_tag_files+=("$staged_file")
    done

    mkdir "$stage_dir/old" || { rm -rf -- "$stage_dir"; return 1; }
    for old_file in "${old_tag_files[@]}"; do
        if ! mv -- "$old_file" "$stage_dir/old/${old_file##*/}"; then
            rollback_failed=0
            for item in "${old_tag_files[@]}"; do
                [[ -f $stage_dir/old/${item##*/} ]] || continue
                mv -- "$stage_dir/old/${item##*/}" "$item" || rollback_failed=1
            done
            if ((rollback_failed)); then
                echo "Échec du déplacement d’une ancienne page d’étiquette ; les sauvegardes temporaires sont dans « $stage_dir »." >&2
                return 1
            fi
            rm -rf -- "$stage_dir"
            return 1
        fi
    done

    for staged_file in "${staged_tag_files[@]}"; do
        post_path=./${staged_file##*/}
        if ! mv -- "$staged_file" "$post_path"; then
            rollback_failed=0
            for tagname in "${installed_tag_files[@]}"; do rm -f -- "$tagname" || rollback_failed=1; done
            for old_file in "${old_tag_files[@]}"; do
                [[ -f $stage_dir/old/${old_file##*/} ]] || continue
                mv -- "$stage_dir/old/${old_file##*/}" "$old_file" || rollback_failed=1
            done
            if ((rollback_failed)); then
                echo "Échec de la publication des pages d’étiquette et de leur restauration ; les fichiers de secours sont dans « $stage_dir »." >&2
                return 1
            fi
            rm -rf -- "$stage_dir"
            return 1
        fi
        installed_tag_files+=("$post_path")
    done

    rm -rf -- "$stage_dir" || { echo "Pages reconstruites, mais impossible de nettoyer « $stage_dir »." >&2; return 1; }
    echo
}

# Return the post title
#
# $1 the html file
get_post_title() {
    awk '/<h3><a class="ablack" href=".+">/, /<\/a><\/h3>/{if (!/<h3><a class="ablack" href=".+">/ && !/<\/a><\/h3>/) print}' "$1"
}

# Return the post author
#
# $1 the html file
get_post_author() { 
    awk '/<div class="subtitle">.+/, /<!-- text begin -->/{if (!/<div class="subtitle">.+/ && !/<!-- text begin -->/) print}' "$1" | sed 's/<\/div>//g'
}

# Displays a list of the tags
#
# $2 if "-n", tags will be sorted by number of posts
list_tags() {
    if [[ $2 == -n ]]; then do_sort=1; else do_sort=0; fi

    if ! compgen -G "./$prefix_tags*.html" > /dev/null; then
        echo "Aucun billet pour le moment. Utilise « bash bbnew post » pour en créer un."
        return
    fi

    lines=""
    for i in "$prefix_tags"*.html; do
        [[ -f "$i" ]] || break
        nposts=$(grep -c "<!-- text begin -->" "$i")
        tagname=${i#"$prefix_tags"}
        tagname=${tagname#.html}
        ((nposts > 1)) && word=$template_tags_posts || word=$template_tags_posts_singular
        line="$tagname # $nposts # $word"
        lines+="$line"$'\n'
    done

    if (( do_sort == 1 )); then
        printf '%s' "$lines" | column -t -s "#" | sort -nrk 2
    else
        printf '%s' "$lines" | column -t -s "#"
    fi
}

# Displays a list of the posts
list_posts() {
    if ! compgen -G './*.html' > /dev/null; then
        echo "Aucun billet pour le moment. Utilise « bash bbnew post » pour en créer un."
        return
    fi

    lines=""
    n=1
    while IFS='' read -r i; do
        is_boilerplate_file "$i" && continue
        line="$n # $(get_post_title "$i") # $(LC_ALL=$date_locale date -r "$i" +"$date_format")"
        lines+="$line"$'\n'
        n=$(( n + 1 ))
    done < <(sort_posts_by_created ./*.html)

    printf '%s' "$lines" | column -t -s "#"
}

# Generate the feed file
make_rss() {
    echo -n "Génération du flux RSS "
    rssfile=$(mktemp "./.${blog_feed}.XXXXXX") || return 1

    {
        pubdate=$(LC_ALL=C date +"$date_format_full")
        echo '<?xml version="1.0" encoding="UTF-8" ?>' 
        echo '<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:dc="http://purl.org/dc/elements/1.1/">' 
        echo "<channel><title>$global_title</title><link>$global_url/$index_file</link>"
        echo "<description>$global_description</description><language>$rss_language</language>"
        echo "<lastBuildDate>$pubdate</lastBuildDate>"
        echo "<pubDate>$pubdate</pubDate>"
        echo "<atom:link href=\"$global_url/$blog_feed\" rel=\"self\" type=\"application/rss+xml\" />"
    
        n=0
        while IFS='' read -r i; do
            is_boilerplate_file "$i" && continue
            ((n >= number_of_feed_articles)) && break # max 10 items
            echo -n "." 1>&3
            echo '<item><title>' 
            get_post_title "$i"
            echo '</title><description><![CDATA[' 
            get_html_file_content 'text' 'entry' $cut_do <"$i"
            echo "]]></description><link>$global_url/${i#./}</link>" 
            echo "<guid>$global_url/$i</guid>" 
            echo "<dc:creator>$(get_post_author "$i")</dc:creator>" 
            echo "<pubDate>$(LC_ALL=C date -r "$i" +"$date_format_full")</pubDate></item>"
    
            n=$(( n + 1 ))
        done < <(sort_posts_by_created ./*.html)
    
        echo '</channel></rss>'
    } 3>&1 >"$rssfile"
    echo ""

    mv -f -- "$rssfile" "$blog_feed" || { rm -f -- "$rssfile"; return 1; }
    chmod 644 "$blog_feed" || return 1
}

# generate headers, footers, etc
create_includes() {
    {
        echo "<h1 class=\"nomargin\"><a class=\"ablack\" href=\"$global_url/$index_file\">$global_title</a></h1>"
        echo "<div id=\"description\">$global_description</div>"
        printf '<nav class="site-nav" aria-label="Navigation principale">\n'
        printf '<a href="%s">Accueil</a>\n' "$index_file"
        printf '<a href="%s">Archives</a>\n' "$archive_index"
        printf '<a href="%s">À propos</a>\n' "$about_file"
        printf '<a href="oldposts/index.html">Anciens billets</a>\n'
        printf '<a href="%s">Rechercher</a>\n' "$search_file"
        printf '<a href="%s">Tags</a>\n' "$tags_index"
        printf '<a href="https://passiongnulinux.free.nf/forum/">Forum</a>\n'
        printf '<a href="%s">Liens</a>\n' "$links_file"
        echo '</nav>'
        printf '<a class="site-banner-link" href="%s/%s" aria-label="Accueil : %s"><img class="site-banner" src="%s" alt="" /></a>\n' \
            "$global_url" "$index_file" "$global_title" "$global_banner_image"
    } > ".title.html" || return 1

    if [[ -f $header_file ]]; then cp -- "$header_file" .header.html || return 1
    else {
        echo '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">'
        echo "<html xmlns=\"http://www.w3.org/1999/xhtml\" lang=\"$global_language\" xml:lang=\"$global_language\"><head>"
        echo '<meta http-equiv="Content-type" content="text/html;charset=UTF-8" />'
        echo '<meta name="viewport" content="width=device-width, initial-scale=1.0" />'
        printf '<link rel="stylesheet" href="%s" type="text/css" />\n' "${css_include[@]}"
        if [[ -z $global_feedburner ]]; then
            echo "<link rel=\"alternate\" type=\"application/rss+xml\" title=\"$template_subscribe_browser_button\" href=\"$blog_feed\" />"
        else 
            echo "<link rel=\"alternate\" type=\"application/rss+xml\" title=\"$template_subscribe_browser_button\" href=\"$global_feedburner\" />"
        fi
        } > ".header.html" || return 1
    fi

    if [[ -n $footer_file ]]; then
        if [[ ! -f $footer_file ]]; then
            echo "Le pied de page configuré est introuvable : « $footer_file »." >&2
            rm -f -- ".title.html" ".header.html"
            return 1
        fi
        cp -- "$footer_file" .footer.html || return 1
    else {
        protected_mail=${global_email//@/&#64;}
        protected_mail=${protected_mail//./&#46;}
        echo "<div id=\"footer\">$global_license <a href=\"$global_author_url\">$global_author</a> &mdash; <a href=\"mailto:$protected_mail\">$protected_mail</a><br/>"
        echo 'Généré avec <a href="https://github.com/cfenollosa/bashblog">BashBlog</a>, un outil de blog statique écrit en Bash.</div>'
        } >> ".footer.html" || return 1
    fi
}

# Strip a leading YAML metadata block from a Markdown page.
strip_page_frontmatter() {
    awk 'NR == 1 && $0 == "---" { frontmatter = 1; next }
         frontmatter && $0 == "---" { frontmatter = 0; next }
         !frontmatter { print }' "$1" > "$2"
}

# Convert Markdown with the configured converter or Pandoc as a fallback.
render_page_markdown() {
    local rendered
    if test_markdown; then
        rendered=$(markdown "$1") || return 1
        cat "$rendered" > "$2"
        local status=$?
        rm -f -- "$rendered"
        return "$status"
    fi
    if command -v pandoc >/dev/null 2>&1; then
        pandoc --from=markdown --to=html5 "$1" > "$2"
        return $?
    fi
    echo "Un convertisseur Markdown (Markdown.pl ou Pandoc) est nécessaire pour la page À propos." >&2
    return 1
}

# Generate static About, Search, and Links pages from BashBlog's shared layout.
create_site_pages() {
    local about_content search_content links_content about_markdown about_html license_markdown license_html links_markdown links_html
    about_content=$(mktemp ./.bb-about.XXXXXX) || return 1
    search_content=$(mktemp ./.bb-search.XXXXXX) || { rm -f -- "$about_content"; return 1; }
    links_content=$(mktemp ./.bb-links.XXXXXX) || { rm -f -- "$about_content" "$search_content"; return 1; }
    about_markdown=$(mktemp ./.bb-about-md.XXXXXX) || { rm -f -- "$about_content" "$search_content" "$links_content"; return 1; }
    about_html=$(mktemp ./.bb-about-html.XXXXXX) || { rm -f -- "$about_content" "$search_content" "$links_content" "$about_markdown"; return 1; }
    license_markdown=$(mktemp ./.bb-license-md.XXXXXX) || { rm -f -- "$about_content" "$search_content" "$links_content" "$about_markdown" "$about_html"; return 1; }
    license_html=$(mktemp ./.bb-license-html.XXXXXX) || { rm -f -- "$about_content" "$search_content" "$links_content" "$about_markdown" "$about_html" "$license_markdown"; return 1; }
    links_markdown=$(mktemp ./.bb-links-md.XXXXXX) || { rm -f -- "$about_content" "$search_content" "$links_content" "$about_markdown" "$about_html" "$license_markdown" "$license_html"; return 1; }
    links_html=$(mktemp ./.bb-links-html.XXXXXX) || { rm -f -- "$about_content" "$search_content" "$links_content" "$about_markdown" "$about_html" "$license_markdown" "$license_html" "$links_markdown"; return 1; }

    if [[ ! -f includes/about-mentionslegales.md || ! -f includes/licence.md ]] ||
       [[ ! -f includes/liens.md ]] ||
       ! strip_page_frontmatter includes/about-mentionslegales.md "$about_markdown" ||
       ! strip_page_frontmatter includes/licence.md "$license_markdown" ||
       ! strip_page_frontmatter includes/liens.md "$links_markdown" ||
       ! render_page_markdown "$about_markdown" "$about_html" ||
       ! render_page_markdown "$license_markdown" "$license_html" ||
       ! render_page_markdown "$links_markdown" "$links_html"; then
        rm -f -- "$about_content" "$search_content" "$links_content" "$about_markdown" "$about_html" "$license_markdown" "$license_html" "$links_markdown" "$links_html"
        return 1
    fi

    {
        echo '<nav class="site-nav about-toc" aria-label="Sommaire de la page À propos">'
        echo '<a href="#à-propos">À propos</a>'
        echo '<a href="#mentions-legales">Mentions légales</a>'
        echo '<a href="#licence">Licence GNU FDL</a>'
        echo '</nav>'
        echo '<section class="about-document">'
        cat "$about_html"
        echo '</section>'
        echo '<section id="licence" class="license-document">'
        echo '<h2>Licence complète</h2>'
        cat "$license_html"
        echo '</section>'
    } > "$about_content"

    {
        echo '<h2>Liens utiles</h2>'
        cat "$links_html"
    } > "$links_content"

    cat > "$search_content" <<HTML
<h2>Rechercher dans le blog</h2>
<p>Recherche dans les titres et le contenu des billets.</p>
<form id="search-form" class="search-form" role="search">
    <label for="search-query">Rechercher un mot ou une expression</label>
    <div class="search-controls">
        <input id="search-query" name="q" type="search" autocomplete="off" />
        <button type="submit">Rechercher</button>
    </div>
</form>
<p id="search-status" aria-live="polite">Saisis au moins deux caractères.</p>
<ul id="search-results" class="search-results"></ul>
<noscript><p>La recherche nécessite JavaScript dans le navigateur.</p></noscript>
<script src="$search_script_file" defer="defer"></script>
HTML

    if ! create_html_page "$about_content" "$about_file" yes "$global_title &mdash; À propos"; then
        rm -f -- "$about_content" "$search_content" "$links_content" "$about_markdown" "$about_html" "$license_markdown" "$license_html" "$links_markdown" "$links_html"
        return 1
    fi
    if ! create_html_page "$search_content" "$search_file" yes "$global_title &mdash; Rechercher"; then
        rm -f -- "$about_content" "$search_content" "$links_content" "$about_markdown" "$about_html" "$license_markdown" "$license_html" "$links_markdown" "$links_html"
        return 1
    fi
    if ! create_html_page "$links_content" "$links_file" yes "$global_title &mdash; Liens"; then
        rm -f -- "$about_content" "$search_content" "$links_content" "$about_markdown" "$about_html" "$license_markdown" "$license_html" "$links_markdown" "$links_html"
        return 1
    fi
    chmod 644 "$about_file" "$search_file" "$links_file"
    rm -f -- "$about_content" "$search_content" "$links_content" "$about_markdown" "$about_html" "$license_markdown" "$license_html" "$links_markdown" "$links_html"
}

# Build a small JSON index so the browser can search every post without a server.
create_search_index() {
    local -a excluded_files=("${non_blogpost_files[@]}" "${html_exclude[@]}")
    command -v python3 >/dev/null 2>&1 || {
        echo "Python 3 est nécessaire pour générer l’index de recherche." >&2
        return 1
    }
    python3 - "$search_index_file" "$index_file" "$archive_index" "$tags_index" "$prefix_tags" "${excluded_files[@]}" <<'PY'
from datetime import datetime
from html.parser import HTMLParser
from pathlib import Path
import json
import re
import sys

target = Path(sys.argv[1])
excluded = set(sys.argv[2:5]) | set(sys.argv[6:])
tag_prefix = sys.argv[5]

class PostText(HTMLParser):
    def __init__(self):
        super().__init__(convert_charrefs=True)
        self.in_title = False
        self.in_text = False
        self.ignored = 0
        self.title = []
        self.body = []

    def handle_comment(self, data):
        marker = data.strip()
        if marker == 'text begin':
            self.in_text = True
        elif marker == 'text end':
            self.in_text = False

    def handle_starttag(self, tag, attrs):
        if tag == 'h3':
            self.in_title = True
        if self.in_text and tag in {'script', 'style'}:
            self.ignored += 1

    def handle_endtag(self, tag):
        if tag == 'h3':
            self.in_title = False
        if self.in_text and tag in {'script', 'style'} and self.ignored:
            self.ignored -= 1

    def handle_data(self, data):
        if self.in_title:
            self.title.append(data)
        if self.in_text and not self.ignored:
            self.body.append(data)

posts = []
for path in sorted(Path('.').glob('*.html')):
    if path.name in excluded or path.name.startswith(tag_prefix):
        continue
    source = path.read_text(encoding='utf-8', errors='replace')
    if '<!-- entry begin -->' not in source or '<!-- text begin -->' not in source:
        continue
    parser = PostText()
    parser.feed(source)
    title = re.sub(r'\s+', ' ', ''.join(parser.title)).strip()
    body = re.sub(r'\s+', ' ', ''.join(parser.body)).strip()
    if not title:
        continue
    stamp = re.search(r'<!--\s*bashblog_timestamp:\s*#([^#]+)#\s*-->', source)
    post_date = ''
    if stamp:
        try:
            post_date = datetime.strptime(stamp.group(1), '%Y%m%d%H%M.%S').strftime('%Y-%m-%d')
        except ValueError:
            pass
    posts.append({'title': title, 'url': path.name, 'date': post_date, 'text': body})

temporary = target.with_name(target.name + '.tmp')
temporary.write_text(json.dumps(posts, ensure_ascii=False), encoding='utf-8')
temporary.replace(target)
print(f"Index de recherche actualisé ({len(posts)} billets).")
PY
}

# Delete the temporarily generated include files
delete_includes() {
    rm -f -- ".title.html" ".footer.html" ".header.html"
}

# Create the css file from scratch
create_css() {
    # To avoid overwriting manual changes. However it is recommended that
    # this function is modified if the user changes the blog.css file
    (( ${#css_include[@]} > 0 )) && return || css_include=('main.css' 'blog.css')
    if [[ ! -f blog.css ]]; then 
        # Loaded after main.css; these rules style the BashBlog content structure.
        cat > blog.css <<'CSS'
.header {
    padding-block: 2rem 1.5rem;
}

.site-nav {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 0.5rem;
    margin-bottom: 1.25rem;
}

.site-nav a {
    padding: 0.4rem 0.85rem;
    border: 1px solid var(--border);
    border-radius: 999px;
    color: var(--text);
    font-weight: 650;
}

.site-nav a:hover {
    background: var(--accent);
    color: var(--surface);
    text-decoration: none;
}

.site-banner-link {
    display: block;
    margin: 0 auto 1.25rem;
    overflow: hidden;
    border: 1px solid var(--border);
    border-radius: 1rem;
    box-shadow: var(--shadow);
}

.site-banner {
    display: block;
    width: 100%;
    height: auto;
}

#title h1,
h1.nomargin {
    text-align: center;
    margin: 0;
    font-size: clamp(1.8rem, 4vw, 2.6rem);
    font-weight: 750;
    letter-spacing: -0.045em;
    line-height: 1.1;
}

#description {
    text-align: center;
    margin-top: 0.65rem;
    color: var(--muted);
    font-size: 1.05rem;
}

.content > h3 {
    margin: 2.75rem 0 0.55rem;
    font-size: clamp(1.45rem, 3vw, 1.9rem);
    font-weight: 700;
    letter-spacing: -0.035em;
    line-height: 1.2;
}

.content > h3:not(:first-child) {
    padding-top: 2.25rem;
    border-top: 1px solid var(--border);
}

.content h3 a.ablack {
    color: var(--text);
}

.content h3 a.ablack:hover {
    color: var(--accent);
}

.subtitle {
    margin: 0.65rem 0 1.25rem;
    color: var(--muted);
    font-size: 0.9rem;
}

.content p {
    margin: 0 0 1.15rem;
}

.content h4,
.content h5,
.content h6 {
    margin: 2rem 0 0.75rem;
    line-height: 1.3;
}

.content ul,
.content ol {
    padding-left: 1.5rem;
}

.content li {
    margin: 0.4rem 0;
    padding-left: 0.2rem;
}

.content blockquote {
    margin: 1.5rem 0;
    padding: 0.25rem 1.25rem;
    border-left: 4px solid var(--accent);
    border-radius: 0 0.75rem 0.75rem 0;
    background: #f1f5f9;
    color: #475569;
}

.content pre {
    overflow-x: auto;
    padding: 1rem 1.2rem;
    border: 1px solid var(--border);
    border-radius: 0.8rem;
    background: #f8fafc;
    font-size: 0.9rem;
}

.content code {
    font-family: "SFMono-Regular", Consolas, "Liberation Mono", monospace;
    font-size: 0.9em;
}

.content img,
.content video,
.content iframe {
    max-width: 100%;
    height: auto;
    border-radius: 0.8rem;
}

.content table {
    display: block;
    max-width: 100%;
    overflow-x: auto;
    border-collapse: collapse;
}

.content th,
.content td {
    padding: 0.65rem 0.85rem;
    border: 1px solid var(--border);
    text-align: left;
}

.content th {
    background: #f8fafc;
}

.content .readmore {
    margin-top: -0.5rem;
    font-size: 0.95rem;
}

.content .readmore a,
#all_posts a {
    font-weight: 650;
}

.search-form {
    margin: 1.5rem 0;
}

.search-form label {
    display: block;
    margin-bottom: 0.5rem;
    font-weight: 650;
}

.search-controls {
    display: flex;
    gap: 0.65rem;
}

.search-controls input {
    min-width: 0;
    flex: 1;
    padding: 0.75rem 0.9rem;
    border: 1px solid var(--border);
    border-radius: 0.6rem;
    background: var(--surface);
    color: var(--text);
    font: inherit;
}

.search-controls button {
    padding: 0.75rem 1rem;
    border: 0;
    border-radius: 0.6rem;
    background: var(--accent);
    color: var(--surface);
    font: inherit;
    font-weight: 700;
    cursor: pointer;
}

.search-controls button:hover {
    filter: brightness(0.92);
}

.search-results {
    padding: 0;
    list-style: none;
}

.search-result {
    padding: 1rem 0;
    border-top: 1px solid var(--border);
}

.search-result h3 {
    margin: 0 0 0.25rem;
    font-size: 1.15rem;
}

.search-result time {
    color: var(--muted);
    font-size: 0.9rem;
}

.search-result p {
    margin: 0.5rem 0 0;
}

@media (prefers-color-scheme: dark) {
    .content blockquote {
        background: #1f2937;
        color: #cbd5e1;
    }

    .content pre,
    .content th {
        background: #0f172a;
    }
}

.allposts_header {
    margin: 2rem 0 0.5rem;
    color: var(--muted);
    font-size: 0.85rem;
    font-weight: 700;
    letter-spacing: 0.08em;
    text-transform: uppercase;
}

#all_posts {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 0.5rem 1.25rem;
    margin-top: 2.5rem;
    padding-top: 1.5rem;
    border-top: 1px solid var(--border);
    text-align: center;
}

#twitter {
    margin: 1.5rem 0 0;
    color: var(--muted);
    font-size: 0.9rem;
    text-align: right;
}

#footer {
    margin: 2rem 0 0;
    padding-top: 1.25rem;
    border-top: 1px solid var(--border);
    color: var(--muted);
    font-size: 0.8rem;
    line-height: 1.6;
    text-align: center;
}

@media (max-width: 600px) {
    .header {
        padding-block: 1.5rem 1.15rem;
    }

    .content > h3 {
        margin-top: 2rem;
    }

    .content > h3:not(:first-child) {
        padding-top: 1.6rem;
    }

    #all_posts {
        flex-direction: column;
        gap: 0.75rem;
    }

    .search-controls {
        flex-direction: column;
    }
}

CSS
    fi

    # If there is a style.css from the parent page (i.e. some landing page)
    # then use it. This directive is here for compatibility with my own
    # home page. Feel free to edit it out, though it doesn't hurt
    if [[ -f ../style.css ]] && [[ ! -f main.css ]]; then
        ln -s "../style.css" "main.css" 
    elif [[ ! -f main.css ]]; then
        cat > main.css <<'CSS'
:root {
    color-scheme: light dark;
    --page: #f1f5f9;
    --surface: #ffffff;
    --text: #172033;
    --muted: #64748b;
    --accent: #2563eb;
    --border: #e2e8f0;
    --shadow: 0 18px 55px rgb(15 23 42 / 0.08);
}

* {
    box-sizing: border-box;
}

html {
    scroll-behavior: smooth;
}

body {
    margin: 0;
    padding: 1px 0;
    background: var(--page);
    color: var(--text);
    font-family: Ubuntu, "DM Sans", ui-sans-serif, system-ui, sans-serif;
    font-size: 16px;
    line-height: 1.75;
    -webkit-font-smoothing: antialiased;
}

a {
    color: var(--accent);
    text-decoration: none;
    text-underline-offset: 0.18em;
    transition: color 150ms ease;
}

a:hover {
    color: #1d4ed8;
    text-decoration: underline;
}

a:focus-visible {
    border-radius: 0.2rem;
    outline: 3px solid rgb(37 99 235 / 0.35);
    outline-offset: 3px;
}

#divbodyholder {
    width: min(calc(100% - 2rem), 900px);
    margin: clamp(1rem, 5vw, 3.5rem) auto;
}

.headerholder {
    padding-inline: clamp(1.25rem, 5vw, 3.5rem);
}

.header {
    width: 100%;
    max-width: 760px;
    margin: 0 auto;
}

#divbody {
    position: relative;
    padding: clamp(1.4rem, 5vw, 3.5rem);
    border: 1px solid rgb(226 232 240 / 0.8);
    border-radius: 1.4rem;
    background: var(--surface);
    box-shadow: var(--shadow);
}

.content {
    max-width: 760px;
    margin: 0 auto;
    overflow-wrap: anywhere;
}

.nomargin {
    margin: 0;
}

.clear {
    clear: both;
}

::selection {
    background: rgb(37 99 235 / 0.18);
}

@media (max-width: 600px) {
    body {
        font-size: 15px;
    }

    #divbodyholder {
        width: min(calc(100% - 1rem), 900px);
        margin: 0.5rem auto;
    }

    .headerholder {
        padding-inline: 0.75rem;
    }

    #divbody {
        padding: 1.25rem 1rem;
        border-radius: 1rem;
    }
}

@media (prefers-reduced-motion: reduce) {
    html {
        scroll-behavior: auto;
    }

    *,
    *::before,
    *::after {
        transition-duration: 0.01ms !important;
    }
}

@media (prefers-color-scheme: dark) {
    :root {
        color-scheme: dark;
        --page: #0b1120;
        --surface: #111827;
        --text: #e5e7eb;
        --muted: #9ca3af;
        --accent: #93c5fd;
        --border: #293548;
        --shadow: 0 18px 55px rgb(0 0 0 / 0.28);
    }
}
CSS
    fi
}

# Regenerates all the single post entries, keeping the post content but modifying
# the title, html structure, etc
rebuild_all_entries() {
    echo -n "Reconstruction des billets "

    for i in ./*.html; do
        is_boilerplate_file "$i" && continue;
        contentfile=$(mktemp ./.bb-rebuild-entry.XXXXXX) || return 1

        echo -n "."
        # Get the title and entry, and rebuild the html structure from scratch (divs, title, description...)
        title=$(get_post_title "$i")

        if ! (set -o pipefail; get_html_file_content 'text' 'text' <"$i" |
            sed "s|^<p>$legacy_tags_line_header|<p>$template_tags_line_header|") >> "$contentfile"; then
            echo "Échec de la lecture du billet « $i » pendant sa reconstruction." >&2
            rm -f -- "$contentfile"
            return 1
        fi

        # Preserve publication and creation timestamps while rebuilding.
        timestamp=$(awk '/<!-- '$date_inpost': .+ -->/ { print }' "$i" | cut -d '#' -f 2)
        [[ -n $timestamp ]] && touch -t "$timestamp" "$i"
        created_timestamp=$(awk '/<!-- '$date_created_inpost': .+ -->/ { print }' "$i" | cut -d '#' -f 2)
        [[ -n $created_timestamp ]] || created_timestamp=$timestamp
        # Read timestamp from file in correct format for 'create_html_page'
        timestamp=$(LC_ALL=C date -r "$i" +"$date_format_full")

        create_html_page "$contentfile" "$i.rebuilt" no "$title" "$timestamp" "$(get_post_author "$i")" || {
            rm -f -- "$contentfile"
            return 1
        }
        # keep the original timestamp!
        timestamp=$(LC_ALL=C date -r "$i" +"$date_format_timestamp")
        if ! mv -f -- "$i.rebuilt" "$i" || ! chmod 644 "$i" || ! touch -t "$timestamp" "$i"; then
            echo "Impossible de remplacer correctement le billet « $i » ; le fichier reconstruit est conservé sous « $i.rebuilt » si le déplacement a échoué." >&2
            rm -f -- "$contentfile"
            return 1
        fi
        rm -f -- "$contentfile" || return 1
    done
    echo ""
}

# Displays the help
usage() {
    echo "$global_software_name v$global_software_version"
    echo "Utilisation : bash $0 commande [fichier]"
    echo ""
    echo "Commandes :"
    echo "    post [-html] [fichier] crée un billet ou ouvre un brouillon existant"
    echo "                            Markdown est utilisé si un convertisseur compatible est disponible, sinon HTML."
    echo "                            '-html' force l’édition en HTML."
    echo "    page [fichier.md|drafts/fichier.html] crée une page puis propose de publier ou garder un brouillon"
    echo "                            sans fichier, ouvre l’éditeur en Markdown si disponible, sinon en HTML."
    echo "    edit [-n|-f] [fichier] modifie un billet publié en préservant ses données"
    echo "                            '-n' autorise un nouveau nom si le titre change"
    echo "                            '-f' ouvre le fichier HTML complet et conserve son nom"
    echo "    delete [fichier]       supprime un billet puis reconstruit le blog"
    echo "    rebuild                régénère les billets et les pages du blog"
    echo "    reset                  supprime les billets, styles et flux générés après confirmation"
    echo "    list                   affiche les billets"
    echo "    tags [-n]              affiche les étiquettes ; '-n' trie par nombre de billets"
    echo ""
    echo "Pour plus d’informations, consulte les commentaires dans le script $0."
}

# Delete all generated content, leaving only this script
reset() {
    echo "Confirme la suppression de tous les billets en écrivant exactement « Oui, je confirme ! » : "
    read -r line || { echo "Lecture de la confirmation impossible ; aucune suppression effectuée." >&2; return 1; }
    if [[ $line == "Oui, je confirme !" ]]; then
        local -a generated_files=()
        local candidate
        for candidate in .*.html ./*.html ./*.css ./*.rss; do
            [[ -e $candidate ]] && generated_files+=("$candidate")
        done
        if ((${#generated_files[@]})) && ! rm -f -- "${generated_files[@]}"; then
            echo "Échec de la suppression de certains fichiers générés." >&2
            return 1
        fi
        echo
        echo "Billets, feuilles de style et flux supprimés."
        echo "La sauvegarde '.backup.tar.gz' a été conservée."
    else
        echo "Confirmation incorrecte : aucune modification effectuée."
    fi
}

# Detects if GNU date is installed
date_version_detect() {
	if ! command date --version >/dev/null 2>&1; then
		# date utility is BSD. Test if gdate is installed 
		if command gdate --version >/dev/null 2>&1 ; then
            date() {
                gdate "$@"
            }
		else
            # BSD date
            date() {
                if [[ $1 == -r ]]; then
                    # Fall back to using stat for 'date -r'
                    format=${3//+/}
                    stat -f "%Sm" -t "$format" "$2"
                elif [[ $2 == --date* ]]; then
                    # convert between dates using BSD date syntax
                    command date -j -f "$date_format_full" "${2#--date=}" "$1" 
                else
                    # acceptable format for BSD date
                    command date -j "$@"
                fi
            }
        fi
    fi    
}

# Main function
# Encapsulated on its own function for readability purposes
#
# $1     command to run
# $2     file name of a draft to continue editing (optional)
do_main() {
    local -a html_files=()
    local file backup_tmp yesterday_tmp page_result
    # Detect if using BSD date or GNU date
    date_version_detect
    # Load default configuration, then override settings with the config file
    global_variables
    if [[ -f $global_config ]]; then
        # Configuration is shell code by design; report syntax/runtime errors
        # instead of silently continuing with partially loaded settings.
        # shellcheck disable=SC1090
        source "$global_config" || {
        echo "Impossible de charger la configuration « $global_config »." >&2
            exit 1
        }
    fi
    global_variables_check || exit 1

    # Check for validity of argument
    [[ $1 != "reset" && $1 != "post" && $1 != "page" && $1 != "rebuild" && $1 != "list" && $1 != "edit" && $1 != "delete" && $1 != "tags" ]] && 
        usage && exit 2

    [[ $1 == list ]] &&
        list_posts && exit

    [[ $1 == tags ]] &&
        list_tags "$@" && exit

    if [[ $1 == page ]] && (($# > 2)); then
        echo "Utilisation : page [fichier.md]" >&2
        exit 2
    fi

    if [[ $1 == edit ]]; then
        if (($# < 2)) || [[ ! -f ${!#} ]]; then
            echo "Indique un fichier .md ou .html valide à modifier." >&2
            exit
        fi
    fi

    # Gather HTML files without relying on `ls` or an unexpanded wildcard.
    for file in ./*.html; do
        [[ -f $file ]] && html_files+=("${file#./}")
    done
    if ((${#html_files[@]})); then
        # Build the archive beside its destination and replace it only after
        # tar has completed successfully, preserving the previous backup.
        backup_tmp=$(mktemp ./.backup.tar.gz.XXXXXX) || {
            echo "Impossible de créer le fichier temporaire de sauvegarde." >&2
            exit 1
        }
        if ! tar -c -z -f "$backup_tmp" -- "${html_files[@]}" ||
            ! chmod 600 "$backup_tmp" || ! mv -f -- "$backup_tmp" .backup.tar.gz; then
            rm -f -- "$backup_tmp"
            echo "Échec de la sauvegarde des fichiers HTML ; aucune commande n’a été exécutée." >&2
            exit 1
        fi
    elif [[ $1 == rebuild ]]; then
        echo "Aucun fichier HTML trouvé ; rien à reconstruire."
        exit
    fi

    # Keep first backup of this day containing yesterday's version of the blog
    if [[ -f .backup.tar.gz ]] &&
        { [[ ! -f .yesterday.tar.gz ]] || [[ $(date -r .yesterday.tar.gz +'%d') != "$(date +'%d')" ]]; }; then
        yesterday_tmp=$(mktemp ./.yesterday.tar.gz.XXXXXX) || {
            echo "Impossible de préparer la sauvegarde journalière." >&2
            exit 1
        }
        if ! cp -- .backup.tar.gz "$yesterday_tmp" || ! chmod 600 "$yesterday_tmp" ||
            ! mv -f -- "$yesterday_tmp" .yesterday.tar.gz; then
            rm -f -- "$yesterday_tmp"
            echo "Échec de la mise à jour de la sauvegarde journalière." >&2
            exit 1
        fi
    fi

    if [[ $1 == reset ]]; then
        reset
        exit $?
    fi

    create_css || exit 1
    create_includes || exit 1
    if [[ $1 == post ]]; then
        write_entry "$@" || { delete_includes; exit 1; }
    fi
    if [[ $1 == page ]]; then
        write_page "${2:-}"
        page_result=$?
        if ((page_result == 3)); then
            delete_includes
            exit 0
        elif ((page_result != 0)); then
            delete_includes
            exit 1
        fi
    fi
    if [[ $1 == rebuild ]]; then
        if ! rebuild_all_entries || ! rebuild_tags; then
            delete_includes
            exit 1
        fi
    fi
    if [[ $1 == delete ]]; then
        if [[ -z $2 || ! -f $2 || ${2##*.} != html || $2 == /* || $2 == ../* || $2 == */../* ]]; then
            echo "Indique le nom d’un fichier HTML de billet existant à supprimer." >&2
            delete_includes
            exit 1
        fi
        if is_boilerplate_file "$2"; then
            echo "Suppression refusée : ce fichier est une page d’index ou d’étiquette générée." >&2
            delete_includes
            exit 1
        fi
        if ! rm -f -- "$2" || ! rebuild_tags; then
            delete_includes
            exit 1
        fi
    fi
    if [[ $1 == edit ]]; then
        if [[ $2 == -n ]]; then
            edit "$3" || { delete_includes; exit 1; }
        elif [[ $2 == -f ]]; then
            edit "$3" full || { delete_includes; exit 1; }
        else
            edit "$2" keep || { delete_includes; exit 1; }
        fi
    fi
    if ! create_site_pages || ! create_search_index; then
        delete_includes
        exit 1
    fi
    if ! rebuild_index || ! all_posts || ! all_tags || ! make_rss; then
        delete_includes
        exit 1
    fi
    delete_includes
}


#
# MAIN
# Do not change anything here. If you want to modify the code, edit do_main()
#
do_main "$@"

# vim: set shiftwidth=4 tabstop=4 expandtab:
