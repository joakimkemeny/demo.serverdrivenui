type Props = {
  color?: string
  size?: number
}

export function MoneyIcon({ color, size }: Props) {
  return (
    <svg
      fill={color ?? "#ffffff"}
      height={size || 20}
      viewBox="0 0 20 20"
      width={size || 20}
      xmlns="http://www.w3.org/2000/svg"
    >
      <g transform="translate(1 1)">
        <path d="m0 0h17.8418v18.6721h-17.8418z" opacity="0" />
        <path d="m3.37891 9.10656c2.09961 0 3.36914-1.72852 3.36914-4.48242 0-2.75391-1.2793-4.453129-3.36914-4.453129-2.09961 0-3.37891 1.708989-3.37891 4.453129 0 2.76367 1.26953 4.48242 3.37891 4.48242zm0-1.36719c-1.13282 0-1.80664-1.14258-1.80664-3.11523 0-1.94336.68359-3.09571 1.80664-3.09571 1.12304 0 1.79687 1.14258 1.79687 3.09571 0 1.97265-.66406 3.11523-1.79687 3.11523zm11.09379 10.76173c2.0996 0 3.3691-1.7285 3.3691-4.4727 0-2.7636-1.2793-4.46286-3.3691-4.46286-2.0997 0-3.3789 1.70896-3.3789 4.46286s1.2695 4.4727 3.3789 4.4727zm0-1.3574c-1.1329 0-1.8067-1.1524-1.8067-3.1153 0-1.9531.6836-3.0957 1.8067-3.0957 1.123 0 1.7968 1.1328 1.7968 3.0957s-.664 3.1153-1.7968 3.1153zm-11.79692 1.3965c.36133.205.88867.1757 1.20117-.2735l11.47465-16.96288c.3418-.488278.1367-.986324-.2246-1.201168-.3418-.1855471-.8204-.1464846-1.1622.341797l-11.47457 16.914051c-.35156.4981-.17578.9668.18555 1.1817z" />
      </g>
    </svg>
  )
}