# RTMP Social Multicast Server

Want to stream to Twitch, Youtube, or Periscope at the same time? That's what this project allows you!

## Prerequisites

- Git
- Docker
- Docker Compose

## Getting Started

This guide will go through configuration and how to use it with OBS.
Make sure to have all the prerequisites installed on your machine.

1. Clone the repo

```bash
$ git clone https://github.com/HorusGoul/rtmp-social-multicast
```

2. Open the repo

```bash
$ cd rtmp-social-multicast
```

3. Create a `.env` file based on the `.env.template` file.

```bash
$ cp .env.template .env
```

4. Open and fill the `.env` file and fill it with the configuration for the platforms you want to stream.

    - [Configuring YouTube](#configuring-youtube)
    - [Configuring Twitch](#configuring-twitch)
    - [Configuring Periscope](#configuring-periscope)
    - [Configuring Facebook](#configuring-facebook)

⚠️ &nbsp;**Make sure to use a strong `RTMP_SECRET` if you plan to expose the server to the internet.**

⚠️ &nbsp;**Avoid changing the `RTMP_AUTH_SERVER` variable unless you know what you're doing.**

5. Now let's launch everything with Docker Compose

```bash
$ docker-compose up
```

6. Time to stream! We'll use OBS in this guide, but other streaming software should support this configuration.

![Obs Stream Configuration](./docs/obs-custom-server.png)

In the `Stream` configuration for OBS, select the `Custom...` service, then write `rtmp://localhost/live` into the `Server` field.

The `Stream Key` field corresponds with the `RTMP_SECRET` you defined in the `.env` file, so make sure it's the same, or you won't be able to start your streaming session.

**All set! Let's go live 🔴**

_If YouTube isn't receiving data from us, that means something went wrong in the process. Recheck everything or open an issue if you can't get it to work following these steps._

---

## Configuring YouTube

_Here is stated how you can get the parameters to fill the **YouTube** section of your `.env` file._

Go to https://youtube.com/livestreaming, and there you'll find this:

![Secret Key and Stream URL](./docs/youtube-key-server.png)

`Stream Key` corresponds with `RTMP_YOUTUBE_KEY`.
`Stream URL` corresponds with `RTMP_YOUTUBE_SERVER`. **Make sure to add a slash (`/`) at the end of the URL if it doesn't have one**.

⚠️ &nbsp;**Remember setting the `RTMP_YOUTUBE_ENABLED` to `true`**

---

## Configuring Twitch

_Here is stated how you can get the parameters to fill the **Twitch** section of your `.env` file._

Go to your Twitch Dashboard following this link: https://dashboard.twitch.tv/settings/stream.
There you'll find your `Primary Stream Key`. We should place it
in the **`RTMP_TWITCH_KEY`** variable.

![Primary Stream Key in the Twitch Dashboard](./docs/twitch-key.png)

Now you need to get the closest server to your location, for that,
Twitch provides this website https://stream.twitch.tv/ingests/.

![Website photo](./docs/twitch-server.png)

Once you pick the best server for you, copy the `rtmp://live-mad.twitch.tv/app/`
part of the URI, that's the value we'll use for the **`RTMP_TWITCH_SERVER`**.
**Don't copy the `{stream_key}` part, or it won't work.**

⚠️ &nbsp;**Remember setting the `RTMP_TWITCH_ENABLED` to `true`**

---

## Configuring Periscope

_Here is stated how you can get the parameters to fill the **Periscope** section of your `.env` file._

Go to the Periscope Producer Page following this link: https://www.periscope.tv/account/producer.
There you'll find your `Stream Key`. We should place it
in the **`RTMP_PERISCOPE_KEY`** variable.

We can also find the `Server URL` that we should place in the **`RTMP_PERISCOPE_SERVER`** variable. **Make sure to add a slash (`/`) at the end of the URL if it doesn't have one**.

![Secret Key and Stream URL](./docs/periscope-key-server.png)

⚠️ &nbsp;**Remember setting the `RTMP_PERISCOPE_ENABLED` to `true`**

---

## Configuring Facebook

_Here is stated how you can get the parameters to fill the **Facebook** section of your `.env` file._

Go to the Facebook Live Producer page following this link: https://www.facebook.com/live/producer/.
Select proper space you will post your live (your timeline or facebook page). In the main section you will find your `Stream Key`. We should place it
in the **`RTMP_FACEBOOK_KEY`** variable.

We can also find the `Server URL`, but Facebook at this point uses only one URL: `live-api-s.facebook.com:443`. It is set for SSL tunneling in the stunnel4 config, so there's no need to adjust this.

⚠️ &nbsp;**Remember setting the `RTMP_FACEBOOK_ENABLED` to `true`**

---


## Support me

Feel free to buy me a coffee if you enjoy my content 😄

<a href="https://www.buymeacoffee.com/horus" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-black.png" alt="Buy Me A Coffee" height="48px"></a>

## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://horus.dev/"><img src="https://avatars.githubusercontent.com/u/6759612?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Horus Lugo</b></sub></a><br /><a href="https://github.com/HorusGoul/rtmp-social-multicast/commits?author=HorusGoul" title="Code">💻</a> <a href="#ideas-HorusGoul" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/HorusGoul/rtmp-social-multicast/commits?author=HorusGoul" title="Documentation">📖</a> <a href="#maintenance-HorusGoul" title="Maintenance">🚧</a> <a href="https://github.com/HorusGoul/rtmp-social-multicast/pulls?q=is%3Apr+reviewed-by%3AHorusGoul" title="Reviewed Pull Requests">👀</a> <a href="#content-HorusGoul" title="Content">🖋</a></td>
    <td align="center"><a href="https://github.com/ivellios"><img src="https://avatars.githubusercontent.com/u/200957?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Janusz Kamieński</b></sub></a><br /><a href="https://github.com/HorusGoul/rtmp-social-multicast/commits?author=ivellios" title="Code">💻</a> <a href="https://github.com/HorusGoul/rtmp-social-multicast/commits?author=ivellios" title="Documentation">📖</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!