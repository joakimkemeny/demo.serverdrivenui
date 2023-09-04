import { NavLink } from "react-router-dom"
import styled from "styled-components"
import { Icon as IconType } from "../../types/Icon"
import { Icon } from "../internal/Icon"

type Props = {
  icon?: IconType
  heading?: string
  label: string
  value?: string
  clientUrl?: string
}

const StyledListItem = styled.li`
  gap: 8px;
  list-style: none;
  padding: 0;

  a {
    color: black !important;
    display: block;
    text-decoration: none;
  }

  svg {
    fill: var(--pink-dark);
  }

  &.item,
  .item {
    display: flex;
    flex-direction: column;
    padding: 8px 16px 8px 16px;

    &.active {
      background-color: var(--pink-light);
    }
  }

  .heading {
    align-self: flex-start;
    background-color: var(--green);
    color: white;
    font-size: 0.8rem;
    padding: 2px 8px;
    height: 24px;
    border-radius: 12px;
  }

  .horizontal {
    display: flex;
    flex: 1;
    gap: 16px;
  }

  .label {
  }

  .value {
    color: var(--label-color);
    flex: 1;
    font-size: 0.8rem;
    text-align: right;
    font-weight: 400;
  }

  &:not(:last-child) {
    border-bottom: 1px solid #e0e0e0;
  }
`

export function DataListItem({ icon, heading, label, value, clientUrl }: Props) {
  const content = (
    <>
      {heading && <span className="heading">{heading}</span>}
      <div className="horizontal">
        {icon && <Icon icon={icon} />}
        {label && <span className="label">{label}</span>}
        {value && <span className="value">{value}</span>}
      </div>
    </>
  )

  if (clientUrl === undefined) {
    return <StyledListItem className="item">{content}</StyledListItem>
  } else {
    return (
      <StyledListItem>
        <NavLink className="item" to={clientUrl}>
          {content}
        </NavLink>
      </StyledListItem>
    )
  }
}
