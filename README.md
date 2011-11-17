# Ey Toolbox#
This simple toolbox adds commands to your unix environment
for simple managing of your rails apps (especially if they're hosted on EngineYard)

## Installing ##
- Fetch the files by running `git clone git@github.com:yonbergman/EyToolbox.git`  
- Run `./install.rb` to add the three commands to you .alias file  
- Clone the `config.example.yml` and add all the apps/enviroments you have set up in Engine Yard

## Commands ##
> ###Deploy
> The deploy commands wraps the `ey deploy` command and helps you use it smartly based on the current directory and current git branch

        >> deploy [env:staging|stage|production|prod] [migrate|migration] [<branch name>]

> deploy has smart defaults like deploying always to the staging environment, from the current branch you're working on and with no migrations
you can pass parameters to change it's defaults in any order you'd like

> ### Run
> Runs your rails app (supports rails 2 and 3)

        >> run [<port>]

> Excepts port number or defaults to the port set up in the config file

> ### Remote
> SSH to a server using `ey ssh`, like deploy uses smart default.

        >> remote [env:stage|staging|prod|production]

>Defaults to ssh'ing to production env

> ### Revision
> Checks the latest revision deployed to to a server

        >> revision [env:stage|staging|prod|production]

>Defaults to ssh'ing to production env
>Links to the github page of that commit


### Yon
