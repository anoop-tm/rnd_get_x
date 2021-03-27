#R&D GetX

This is a sample application to learn flutter with getx patterns and it's other features. I feel a strong love the ideas in https://github.com/kauemurakami/getx_pattern. Together with the snippets in VSCode this pattern can help create good structured projects.

### Contents

###### Home page

This just contains a card showing the count of posts and abums in the app. `HomePage` doesnot have a repository of it's own. It initializes the controllers for `Albums` and `Posts` for the required data.

###### Albums page

This is a simple page with the list of albums displayed using the `ListViewBuilder`.

###### Posts page

This is more detailed page which shows the posts in the page in GridView. Each post opens up to show detailed post along with its comments. This is currently work in progress.

### To do plans

1. Use `get_connect` instead of dio
1. Use `GetService`
