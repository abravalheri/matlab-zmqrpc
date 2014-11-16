# How to contribute

Pull-requests and discussions are essential for any open-source project. Any contribution to this project will be considered lovely. Here's just a quick guide to help you in this journey.

Please have in mind that nothing can be considered 100% truth and immutable (including this statement). This project will not adhere to any `strict` way of development.

## Pull-Requests

Github has two great GREAT articles about contributing: [Contributing to Open Source on GitHub](https://guides.github.com/activities/contributing-to-open-source/) and [Using pull requests](https://help.github.com/articles/using-pull-requests/). Please make sure to read it in your lifetime (everyone that reads became a better person).

> Oh man, [guides.github.com](https://guides.github.com/) and [help.github.com](https://help.github.com) are astonishing!

Please, try to keep your commit messages as communicative as possible. There is a good [reference](https://github.com/erlang/otp/wiki/Writing-good-commit-messages) for it as well :blush:.

> I usually think in the commit itself as an implicit subject of commit message.
>For example: `[This commit] Add .gitignore`

Communication is _always_ handy! If you have any doubt or would like to discuss your thoughts, you are more than welcome to send me a message! Please comment directly on the code, open an issue, submit a pull request, mention me anywhere... I think GitHub has good tools to help developers communicate and share experiences.

### Code Guidelines

- Two spaces, no tabs - _It's a personal choice, I know... but it's good considering multiline alignment_ :smiling_imp:
- No trailing whitespace. Blank lines should not have any space
- Operators should be wrapped by spaces (`a = b`, `a + b`, ... and not `a=b`)
- Parenthesis and brackets should not be wrapped by spaces, especially in function call/declaration (`plot(x, y)` and not `plot (x, y)`, `plot( x, y )`)
- Commas should be followed by a space (`plot(x, y)` and not `plot(x,y)`)
- I usually appreciate the code as shorter as possible, and I like 'one-line' `if`s, `for`s, etc... - _Hatters gonna hate_
- Follow the conventions you see used in the source already - _The best tip so far_ :kissing_heart:

Please have a look at [Matlab Style Guidelines](https://sites.google.com/site/matlabstyleguidelines/home), it is a really nice reference. I usually don't follow all the rules, but I'm very inspired by them.

As MATLAB borrow so many thing from Java, I think using `camelCase` for variable name is fine, but I just don't like this convention for function or method names... In this case, I usually prefer `lowercase` and short names, normally with **mnemonics** to abbreviate, like `sendstr`. **Mnemonics** are perfectly fine (come on... everybody loves unix shell interface...).

Short examples:

    thisPropName
    ClassName
    thisfunc
    CONST_NAME

## Reporting a Bug

- Update to the most recent master release if possible. Someone may have already fixed your bug (such a wonderful scenario!)
- Search for similar issues. It's possible somebody has encountered this bug already. In this case comment your experience too!
- Clearly describe the issue including steps to reproduce when it is a bug and preferably send a script that does so. Try to keep all the things fully operational with the exception of the bug you want to demonstrate. (Ok, I admit this is boring, but is probably the fastest way to get thing working).
- Keep up to date with feedback from the project team, maybe you can help us to test ;)
- If possible, submit a Pull Request with a failing test. It would be wonderful to increase the test coverage!
- Consider the challenge of fixing the bug, I'm sure it can be funny or at least very aggrandizing :stuck_out_tongue_winking_eye:

## Requesting a Feature

- Search Issues for similar feature requests. It's possible somebody has already asked for this feature or provided a pull request that we're still discussing.
- Provide a clear and detailed explanation of the feature you want and why it's important to add. Keep in mind that features should be useful to the majority of users and not just a small subset. If you're just targeting a minority of users, consider writing an add-on library.
- If the feature is complex, consider writing some initial documentation for it. If we do end up accepting the feature it will need to be documented and this will also help us to understand it better ourselves.
- Attempt a Pull Request. If you're at all able, start writing some code. We always have more work to do than time to do it. If you can write some code then that will speed the process along.


## NOTE

This guide was partially copied from
- [ember.js](https://raw.githubusercontent.com/emberjs/ember.js/master/CONTRIBUTING.md)
- [factory_girl](https://raw.github.com/thoughtbot/factory_girl_rails/master/CONTRIBUTING.md)
- [puppet](https://raw.githubusercontent.com/puppetlabs/puppet/master/CONTRIBUTING.md)
- [rails](http://edgeguides.rubyonrails.org/contributing_to_ruby_on_rails.html#contributing-to-the-rails-documentation)

Please consider reading them. They are just great!
