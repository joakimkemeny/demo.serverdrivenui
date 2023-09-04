import { useNavigate } from "react-router-dom"
import styled from "styled-components"
import { Icon } from "../../index-server"
import { Button } from "../internal/Button"

type Props = {
  title: string
  intro: string
  actionLabel: string
  actionIcon: Icon
  actionClientUrl: string
  actionServerUrl: string
}

const StyledMain = styled.main`
  align-items: center;
  display: flex;
  height: 100%;
  justify-content: center;
  position: relative;
  width: 100%;

  & > div {
    background-color: var(--pink-light);
    border-bottom-left-radius: 30px;
    border-top-right-radius: 30px;
    box-shadow:
      0 1px 1px hsl(0deg 0% 0% / 0.035),
      0 2px 2px hsl(0deg 0% 0% / 0.035),
      0 4px 4px hsl(0deg 0% 0% / 0.035),
      0 8px 8px hsl(0deg 0% 0% / 0.035),
      0 16px 16px hsl(0deg 0% 0% / 0.035);
    margin: 0 50px;
    max-width: 460px;
    padding: 70px;
    position: relative;

    &:before {
      border: 3px solid var(--pink-dark);
      border-bottom-left-radius: 30px;
      border-top-right-radius: 30px;
      bottom: 30px;
      content: "";
      left: 20px;
      pointer-events: none;
      position: absolute;
      right: -20px;
      top: -30px;
    }
  }

  h1 {
    font-size: 2rem;
    font-weight: 400;
    margin-bottom: 1rem;
  }

  p {
    margin-bottom: 4rem;
  }
`

export function Login({ title, intro, actionLabel, actionIcon, actionClientUrl }: Props) {
  const navigate = useNavigate()

  return (
    <StyledMain>
      <div>
        <h1>{title}</h1>
        <p>{intro}</p>
        <Button
          label={actionLabel}
          icon={actionIcon}
          onAction={() => navigate(actionClientUrl)}
        ></Button>
      </div>
    </StyledMain>
  )
}
