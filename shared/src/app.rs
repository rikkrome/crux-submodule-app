use crux_core::{render::Render, App};
use crux_macros::Effect;
use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize, Default, Debug, Clone)]
pub struct Settings {
    scheme: String,
}

#[derive(Serialize, Deserialize, Debug, Default, Clone)]
pub struct Profile {
    user_name: String,
}
#[derive(Default, Serialize, Deserialize)]
pub struct Model {
    profile: Profile,
    settings: Settings,
}

#[derive(Serialize, Deserialize)]
pub struct ViewModel {
    profile: Profile,
    settings: Settings,
}

impl From<&Model> for ViewModel {
    fn from(model: &Model) -> Self {
        ViewModel {
            profile: model.profile.clone(),
            settings: model.settings.clone(),
        }
    }
}

#[derive(Serialize, Deserialize)]
pub enum Event {
    // events from the shell
    UpdateScheme(String),
    UpdateName(String),
    InitViewModel(ViewModel),
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
            Event::UpdateScheme(scheme) => {
                model.settings.scheme = scheme;
            }
            Event::UpdateName(name) => {
                model.profile.user_name = name.to_string();
            }
            Event::InitViewModel(view_model) => {
                model.profile = view_model.profile;
                model.settings = view_model.settings;
            }
        }
        caps.render.render();
    }

    fn view(&self, model: &Self::Model) -> Self::ViewModel {
        model.into()
        // ViewModel {
        //     scheme: model.settings.scheme.selected.to_string(),
        //     profile: model.profile.clone(),
        // }
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
        let update = app.update(Event::UpdateScheme("Dark".to_string()), &mut model);

        // Check update asked us to `Render`
        let actual_effect = &update.effects[0];
        let expected_effect = &Effect::Render(RenderOperation);
        assert_eq!(actual_effect, expected_effect);

        // Make sure the view matches our expectations
        model.profile.user_name = "Ricky".to_string();
        let actual_view = &app.view(&model).profile.user_name;
        let expected_view = "Ricky";
        assert_eq!(actual_view, expected_view);
    }

    #[test]
    fn app_root_scheme() {
        let app = AppTester::<AppRoot, _>::default();
        let mut model = Model::default();

        // Call 'update' and request effects
        let update = app.update(Event::UpdateScheme("Dark".to_string()), &mut model);

        // Check update asked us to `Render`
        let actual_effect = &update.effects[0];
        let expected_effect = &Effect::Render(RenderOperation);
        assert_eq!(actual_effect, expected_effect);

        let actual_view = app.view(&model).settings.scheme;
        let expected = "Dark".to_string();
        assert_eq!(actual_view, expected);
    }
}
