# Whenever

This cookbook can serve as a good starting point for setting up Whenever support in your application. 
In this recipe your Whenever script will be run as soon as the cluster is created.

## Installation

To install this, you will need to add the following to cookbooks/main/recipes/default.rb:

    require_recipe "whenever"

In the recipe, make sure to set your appname in cookbooks/whenever/recipes/default.rb. Change this line:

    appname = "appname"

To this:

    appname = "my_application_name"

Make sure this and any customizations to the recipe are committed to your own fork of this 
repository.  