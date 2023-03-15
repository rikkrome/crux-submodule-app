use crux_core::{render::Render, App};
use crux_macros::Effect;
use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize)]
pub enum Event {
    // events from the shell
    UpdateScheme(String),
    UpdateName(String),
}

#[derive(Serialize, Deserialize, Default, Debug, PartialEq, Eq)]
pub struct SettingsScheme {
    initialized: bool,
    selected: String, // light / dark
    updated_at: i64,
}

#[derive(Serialize, Deserialize, Default, Debug, PartialEq, Eq)]
pub struct Settings {
    scheme: SettingsScheme,
    updated_at: i64,
}

#[derive(Default, Serialize, Deserialize)]
pub struct Model {
    user_name: String,
    settings: Settings,
}

#[derive(Serialize, Deserialize)]
pub struct ViewModel {
    user_name: String,
    scheme: String,
}

#[derive(Effect)]
#[effect(app = "AppRoot")]
pub struct Capabilities {
    render: Render<Event>,
}

#[derive(Default)]
pub struct AppRoot;

impl App for AppRoot {
    type Event = Event;
    type Model = Model;
    type ViewModel = ViewModel;
    type Capabilities = Capabilities;

    fn update(&self, msg: Self::Event, model: &mut Self::Model, caps: &Self::Capabilities) {
        match msg {
            Event::UpdateScheme(selected) => {
                model.settings.scheme.initialized = true;
                model.settings.scheme.selected = selected;
            }
            Event::UpdateName(name) => {
                model.user_name = name.to_string();
            }
        }
        caps.render.render();
    }

    fn view(&self, model: &Self::Model) -> Self::ViewModel {
        ViewModel {
            user_name: model.user_name.to_string(),
            scheme: model.settings.scheme.selected.to_string(),
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crux_core::{render::RenderOperation, testing::AppTester};

    #[test]
    fn app_root() {
        let app = AppTester::<AppRoot, _>::default();
        let mut model = Model::default();

        // Call 'update' and request effects
        let update = app.update(Event::Format, &mut model);

        // Check update asked us to `Render`
        let actual_effect = &update.effects[0];
        let expected_effect = &Effect::Render(RenderOperation);
        assert_eq!(actual_effect, expected_effect);

        let actual = model.settings.scheme.initialized;
        let expected = true;
        assert_eq!(actual, expected);

        // Make sure the view matches our expectations
        model.user_name = "Hello World".to_string();
        let actual_view = &app.view(&model).user_name;
        let expected_view = "Hello World";
        assert_eq!(actual_view, expected_view);
    }
}
