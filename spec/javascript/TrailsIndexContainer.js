import TrailsIndexContainer from '../../app/javascript/containers/TrailsIndexContainer'
import TrailTile from '../../app/javascript/components/TrailTile'
import { mount } from 'enzyme'
import jasmineEnzyme from 'jasmine-enzyme'
import React from 'react'

describe('TrailsIndexContainer', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = mount(<TrailsIndexContainer />)
  })

  it('should have all trails in trails_array listed', () => {
    expect(wrapper.find(TrailTile)).toBePresent()
  })

  it('should have three trails in the state initially', () => {
    expect(wrapper.state()).toEqual({trails_array})
  })
})
