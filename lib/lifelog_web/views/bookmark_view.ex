defmodule LifelogWeb.BookmarkView do
    use LifelogWeb, :view

    alias LifelogWeb.BookmarkLive

    def bookmark_image(%{ "image_link": image, "icon_link": icon}) when image == ""  and icon == "", do: "https://via.placeholder.com/600x200/?text=no_image"
    def bookmark_image(%{ "image_link": image, "icon_link": icon}) when image != "", do: image
    def bookmark_image(%{ "image_link": image, "icon_link": icon}) when icon != "",  do: icon
    def bookmark_image(%{ "image_link": image, "icon_link": icon}) when image == "", do: icon
    def bookmark_image(%{ "image_link": image, "icon_link": icon}) when icon == "",  do: image
end
