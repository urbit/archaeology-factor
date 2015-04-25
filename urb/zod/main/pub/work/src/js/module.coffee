require './util.coffee'

window.work =
  Component: require './components/WorkComponent.coffee'
  Persistence: require './persistence/WorkPersistence.coffee'
  init: (el) -> @Persistence.listen()