# Prism Launcher с патчем под оффлайн-аккаунт: патч лежит гистом, тянем через
# fetchpatch. Оверлей отдельный, чтобы его было видно в списке.
final: prev:
{
  prismlauncher-unwrapped = prev.prismlauncher-unwrapped.overrideAttrs (old: {
    patches = (old.patches or [ ]) ++ [
      (final.fetchpatch {
        url = "https://gist.githubusercontent.com/Blezz-tech/bc9acc9d02e4eb77c4a0b407f589da26/raw/20c720242c6677ea30646d0fd4f01d514021bf1c/0001-fix-online-account.patch";
        sha256 = "sha256-ttSZQj6GLMSzfvaoSkrSZwavRRtneCn/rvO2QNOOWhA=";
      })
    ];
  });
}
