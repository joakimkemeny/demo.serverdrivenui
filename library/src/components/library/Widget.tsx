import styled from "styled-components"
import { Icon as IconType } from "../../types/Icon"
import { Icon } from "../internal/Icon"

type Props = {
  icon: IconType
  label: string
  value: string
  skeleton?: boolean
}

const StyledDiv = styled.div`
  align-items: center;
  background-color: white;
  border-radius: 8px;
  box-shadow:
    0 1px 1px hsl(0deg 0% 0% / 0.035),
    0 2px 2px hsl(0deg 0% 0% / 0.035),
    0 4px 4px hsl(0deg 0% 0% / 0.035),
    0 8px 8px hsl(0deg 0% 0% / 0.035),
    0 16px 16px hsl(0deg 0% 0% / 0.035);
  display: flex;
  flex: 1;
  flex-direction: column;
  padding: 20px;

  h2 {
    color: var(--label-color);
    font-size: 0.8rem;
    font-weight: 400;
    margin: 15px 0 0 0;
    text-transform: uppercase;
    white-space: nowrap;
  }

  p {
    font-size: 1.2rem;
    font-weight: 500;
  }

  svg {
    fill: var(--pink-dark);
  }
`

export function Widget({ icon, label, value }: Props) {
  return (
    <StyledDiv>
      <Icon icon={icon} size={40} />
      <h2>{label}</h2>
      <p>{value}</p>
    </StyledDiv>
  )
}
