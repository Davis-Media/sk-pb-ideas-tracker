## Getting Started

In order to use this project you will need golang and pnpm on your computer.

To configure Pocketbase you will need to setup the collections from scratch.

For this to work you just have to create one called "ideas", with two columns:

1. idea: string
2. type: select (video, tweet, business, personal, misc)

## Plan

For the project I want to be able to quickly and easily save ideas that come to me from my phone. The UI will be stupidly simple, just a text box and a drop down. Then when the idea is saved I'll add some hooks in the pocketbase server that send the idea to the right place.

- Video ideas get sent to my notion board under "idea"
- Tweet ideas don't do anything special, just get saved
- Business ideas get sent into the insiderviz board
- Personal ideas don't do anything special
