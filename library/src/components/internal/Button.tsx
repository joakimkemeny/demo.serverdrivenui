import type { MouseEvent } from "react"
import { styled } from "styled-components"
import { Icon as IconType } from "../../index-server"
import { Icon } from "./Icon"

type Props = {
  label: string
  icon?: IconType
  onAction: (event: MouseEvent<HTMLButtonElement>) => void
}

const StyledButton = styled.button`
  @layer component {
    & {
      align-items: center;
      background-color: var(--pink-dark);
      border: 0;
      border-radius: 1.5rem;
      color: white;
      display: flex;
      gap: 10px;
      height: 3rem;
      justify-content: center;
      transition: all 0.2s;
      width: 100%;

      &:active {
        transform: scale(1.1);
      }
    }
  }
`

export function Button({ label, icon, onAction }: Props) {
  return (
    <StyledButton onClick={onAction}>
      {icon && <Icon icon={icon} />}
      {label}
    </StyledButton>
  )
}
